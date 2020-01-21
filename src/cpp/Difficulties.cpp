#include "Difficulties.h"

#include "JsonLoader.h"

#include <QJsonArray>
#include <QJsonObject>
#include <QJsonValue>

Difficulties::Difficulties(QObject *parent) : QObject(parent)
{

}

QQmlListProperty<Difficulty> Difficulties::difficulties()
{
    return QQmlListProperty<Difficulty>(this, this,
                                        &Difficulties::appendDifficulty,
                                        &Difficulties::difficultiesCount,
                                        &Difficulties::difficulty,
                                        &Difficulties::clearDifficulties);
}

void Difficulties::appendDifficulty(Difficulty *difficulty)
{
    m_difficulties.append(difficulty);
    emit difficultiesChanged();
}

int Difficulties::difficultiesCount() const
{
    return m_difficulties.count();
}

Difficulty *Difficulties::difficulty(int index) const
{
    return m_difficulties.at(index);
}

void Difficulties::clearDifficulties()
{
    m_difficulties.clear();
    emit difficultiesChanged();
}

void Difficulties::loadDifficulties(const QString &filePath)
{
    JsonLoader loader;
    for ( const QJsonValue item: loader.array(filePath) ) {
        const QJsonObject &tItem = item.toObject();
        const QJsonObject &tName = tItem.value("name").toObject();

        Difficulty *pDifficulty = new Difficulty(tName.value("full").toString(),
                                                 tName.value("short").toString(),
                                                 tItem.value("value").toInt(),
                                                 this);
        appendDifficulty(pDifficulty);
    }
}

void Difficulties::appendDifficulty(QQmlListProperty<Difficulty> *list, Difficulty *difficulty)
{
    reinterpret_cast<Difficulties*>(list->data)->appendDifficulty(difficulty);
}

int Difficulties::difficultiesCount(QQmlListProperty<Difficulty> *list)
{
    return reinterpret_cast<Difficulties*>(list->data)->difficultiesCount();
}

Difficulty *Difficulties::difficulty(QQmlListProperty<Difficulty> *list, int index)
{
    return reinterpret_cast<Difficulties*>(list->data)->difficulty(index);
}

void Difficulties::clearDifficulties(QQmlListProperty<Difficulty> *list)
{
    reinterpret_cast<Difficulties*>(list->data)->clearDifficulties();
}
