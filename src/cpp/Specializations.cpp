#include "Specializations.h"
#include "JsonLoader.h"

#include <QJsonArray>
#include <QJsonObject>
#include <QJsonValue>

Specializations::Specializations(QObject *parent) : QObject(parent)
{

}

QQmlListProperty<Specialization> Specializations::specializations()
{
    return QQmlListProperty<Specialization>(this, this,
                                            &Specializations::appendSpecialization,
                                            &Specializations::specializationsCount,
                                            &Specializations::specialization,
                                            &Specializations::clearSpecializations);
}

void Specializations::appendSpecialization(Specialization *specialization)
{
    m_specializations.append(specialization);
    emit specializationsChanged();
    m_specializationsNames.append(specialization->name());
    emit specializationsNamesChanged();
}

int Specializations::specializationsCount() const
{
    return m_specializations.count();
}

Specialization *Specializations::specialization(int index) const
{
    return m_specializations.at(index);
}

void Specializations::clearSpecializations()
{
    m_specializations.clear();
}

QStringList Specializations::specializationsNames()
{
    return m_specializationsNames;
}

void Specializations::loadSpecializations(const QString &filePath)
{
    JsonLoader loader;
    for ( const QJsonValue item: loader.array(filePath) ) {
        const QJsonObject &tItem = item.toObject();

        Specialization *pSpecialization = new Specialization(tItem.value("name").toString(),
                                                             tItem.value("description").toString(),
                                                             this);
        appendSpecialization(pSpecialization);
    }
}

void Specializations::appendSpecialization(QQmlListProperty<Specialization> *list, Specialization *specialization)
{
    reinterpret_cast<Specializations*>(list->data)->appendSpecialization(specialization);
}

int Specializations::specializationsCount(QQmlListProperty<Specialization> *list)
{
    return reinterpret_cast<Specializations*>(list->data)->specializationsCount();
}

Specialization *Specializations::specialization(QQmlListProperty<Specialization> *list, int index)
{
    return reinterpret_cast<Specializations*>(list->data)->specialization(index);
}

void Specializations::clearSpecializations(QQmlListProperty<Specialization> *list)
{
    reinterpret_cast<Specializations*>(list->data)->clearSpecializations();
}
