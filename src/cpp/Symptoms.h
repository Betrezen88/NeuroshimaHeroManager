#ifndef SYMPTOMS_H
#define SYMPTOMS_H

#include <QObject>
#include <QVector>
#include <QQmlListProperty>

#include "Symptom.h"

class Symptoms : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<Symptom> symptoms READ symptoms NOTIFY symptomsChanged)
    Q_PROPERTY(QStringList symptomsNames READ symptomsNames NOTIFY symptomsNamesChanged)
public:
    explicit Symptoms(QObject *parent = nullptr);

    QQmlListProperty<Symptom> symptoms();
    void appendSymptom(Symptom*);
    int symptomsCount() const;
    Symptom *symptom(int) const;
    void clearSymptoms();

    QStringList symptomsNames();

signals:
    void symptomsChanged();
    void symptomsNamesChanged();

private:
    static void appendSymptom(QQmlListProperty<Symptom>*, Symptom*);
    static int symptomsCount(QQmlListProperty<Symptom>*);
    static Symptom *symptom(QQmlListProperty<Symptom>*, int);
    static void clearSymptoms(QQmlListProperty<Symptom>*);

private:
    QVector<Symptom*> m_symptoms;
    QStringList m_symptomsNames;
};

#endif // SYMPTOMS_H
