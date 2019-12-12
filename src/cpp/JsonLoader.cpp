#include "JsonLoader.h"

#include <QFile>

#include <QJsonArray>
#include <QJsonParseError>
#include <QJsonValue>

#include <QDebug>

QJsonArray JsonLoader::array(const QString &filePath)
{
    load(filePath);
    if ( !m_json.isEmpty() && !m_json.isNull() && !m_json.isArray() )
        return QJsonArray();

    return m_json.array();
}

void JsonLoader::load(const QString &filePath)
{
    QFile file(filePath);

    if ( !file.open(QIODevice::ReadOnly) )
        return;

    QJsonParseError error;
    m_json = QJsonDocument::fromJson(file.readAll(), &error);

    if ( QJsonParseError::NoError != error.error ) {
        qDebug() << error.errorString();
        qDebug() << error.offset;
        m_json = QJsonDocument();
        return;
    }
}
