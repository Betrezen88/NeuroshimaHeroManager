#ifndef DISEASE_H
#define DISEASE_H

#include <QObject>

#include "Symptoms.h"

class Disease: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(QString description READ description CONSTANT)
    Q_PROPERTY(QString cure READ cure CONSTANT)
    Q_PROPERTY(QQmlListProperty<Symptom> symptoms READ symptoms)
public:
    Disease(QObject *parent = nullptr): QObject(parent) {}
    Disease(const QString &name,
           const QString &description,
           const QString &cure,
           QObject *parent = nullptr)
        : QObject(parent),
          m_name(name),
          m_description(description),
          m_cure(cure),
          m_symptoms(new Symptoms(this))
    {}

    QString name() const { return m_name; }
    QString description() const { return m_description; }
    QString cure() const { return m_cure; }
    QQmlListProperty<Symptom> symptoms() { return m_symptoms->symptoms(); }

    void appendSymptom(Symptom *symptom) { m_symptoms->appendSymptom(symptom); }

private:
    QString m_name;
    QString m_description;
    QString m_cure;
    Symptoms *m_symptoms{nullptr};
};

#endif // DISEASE_H
