#include "Diseases.h"
#include "JsonLoader.h"

#include <QJsonArray>
#include <QJsonObject>
#include <QJsonValue>

Diseases::Diseases(QObject *parent) : QObject(parent)
{

}

QQmlListProperty<Disease> Diseases::diseases()
{
    return QQmlListProperty<Disease>(this, this,
                                     &Diseases::appendDisease,
                                     &Diseases::diseasesCount,
                                     &Diseases::disease,
                                     &Diseases::clearDiseases);
}

void Diseases::appendDisease(Disease *disease)
{
    m_diseases.append(disease);
    emit diseasesChanged();
    m_diseasesNames.append(disease->name());
    emit diseasesNamesChanged();
}

int Diseases::diseasesCount() const
{
    return m_diseases.count();
}

Disease *Diseases::disease(int index) const
{
    return m_diseases.at(index);
}

void Diseases::clearDiseases()
{
    m_diseases.clear();
    emit diseasesChanged();
}

QStringList Diseases::diseasesNames()
{
    return m_diseasesNames;
}

void Diseases::loadDiseases(const QString &filePath)
{
    JsonLoader loader;
    for ( const QJsonValue item: loader.array(filePath) ) {
        const QJsonObject &tItem = item.toObject();

        Disease *pDisease = new Disease(tItem.value("name").toString(),
                                        tItem.value("description").toString(),
                                        tItem.value("cure").toString(),
                                        this);

        for ( const QJsonValue symptom: tItem.value("symptoms").toArray() ) {
            const QJsonObject &tSymptom = symptom.toObject();
            Symptom *pSymptom = new Symptom(tSymptom.value("name").toString(),
                                            tSymptom.value("description").toString(),
                                            pDisease);
            for ( const QJsonValue penalty: tSymptom.value("penalties").toArray() ) {
                const QJsonObject &tPenalty = penalty.toObject();
                Penalty *pPenalty = new Penalty(tPenalty.value("name").toString(),
                                                tPenalty.value("type").toString(),
                                                tPenalty.value("value").toInt(),
                                                pSymptom);
                pSymptom->addPenalty(pPenalty);
            }
            pDisease->appendSymptom(pSymptom);
        }
        appendDisease(pDisease);
    }
}

void Diseases::appendDisease(QQmlListProperty<Disease> *list, Disease *disease)
{
    reinterpret_cast<Diseases*>(list->data)->appendDisease(disease);
}

int Diseases::diseasesCount(QQmlListProperty<Disease> *list)
{
    return reinterpret_cast<Diseases*>(list->data)->diseasesCount();
}

Disease *Diseases::disease(QQmlListProperty<Disease> *list, int index)
{
    return reinterpret_cast<Diseases*>(list->data)->disease(index);
}

void Diseases::clearDiseases(QQmlListProperty<Disease> *list)
{
    reinterpret_cast<Diseases*>(list->data)->clearDiseases();
}
