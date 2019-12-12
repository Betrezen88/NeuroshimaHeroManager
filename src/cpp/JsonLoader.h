#ifndef JSONLOADER_H
#define JSONLOADER_H

#include <QString>
#include <QJsonDocument>

class QJsonArray;

class JsonLoader
{
public:
    QJsonArray array(const QString &filePath);

private:
    void load(const QString &filePath);

private:
    QJsonDocument m_json;
};

#endif // JSONLOADER_H
