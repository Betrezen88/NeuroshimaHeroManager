#include "Symptoms.h"

Symptoms::Symptoms(QObject *parent) : QObject(parent)
{

}

QQmlListProperty<Symptom> Symptoms::symptoms()
{
    return QQmlListProperty<Symptom>(this, this,
                                     &Symptoms::appendSymptom,
                                     &Symptoms::symptomsCount,
                                     &Symptoms::symptom,
                                     &Symptoms::clearSymptoms);
}

void Symptoms::appendSymptom(Symptom *symptom)
{
    m_symptoms.append(symptom);
    emit symptomsChanged();
    m_symptomsNames.append(symptom->name());
    emit symptomsNamesChanged();
}

int Symptoms::symptomsCount() const
{
    return m_symptoms.count();
}

Symptom *Symptoms::symptom(int index) const
{
    return m_symptoms.at(index);
}

void Symptoms::clearSymptoms()
{
    m_symptoms.clear();
    emit symptomsChanged();
    m_symptomsNames.clear();
    emit symptomsNamesChanged();
}

QStringList Symptoms::symptomsNames()
{
    return m_symptomsNames;
}

void Symptoms::appendSymptom(QQmlListProperty<Symptom> *list, Symptom *symptom)
{
    reinterpret_cast<Symptoms*>(list->data)->appendSymptom(symptom);
}

int Symptoms::symptomsCount(QQmlListProperty<Symptom> *list)
{
    return reinterpret_cast<Symptoms*>(list->data)->symptomsCount();
}

Symptom *Symptoms::symptom(QQmlListProperty<Symptom> *list, int index)
{
    return reinterpret_cast<Symptoms*>(list->data)->symptom(index);
}

void Symptoms::clearSymptoms(QQmlListProperty<Symptom> *list)
{
    reinterpret_cast<Symptoms*>(list->data)->clearSymptoms();
}
