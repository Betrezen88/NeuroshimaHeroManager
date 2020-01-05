#ifndef SYMPTOM_H
#define SYMPTOM_H

#include <QObject>
#include <QVector>

#include "Penalties.h"

class Symptom: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(QString description READ description CONSTANT)
    Q_PROPERTY(QQmlListProperty<Penalty> penalties READ penalties NOTIFY penaltiesChanged)
public:
    Symptom(QObject *parent = nullptr) : QObject(parent) {}
    Symptom(const QString &name,
            const QString &description,
            QObject *parent = nullptr)
        : QObject(parent),
          m_name(name),
          m_description(description),
          m_penalties(new Penalties(this))
    {}

    QString name() const { return m_name; }
    QString description() const { return m_description; }
    QQmlListProperty<Penalty> penalties() const { return m_penalties->penalties(); }

    void addPenalty(Penalty *penalty) {
        m_penalties->appendPenalty(penalty);
        emit penaltiesChanged();
    }

signals:
    void penaltiesChanged();

private:
    QString m_name;
    QString m_description;
    Penalties *m_penalties{nullptr};
};

#endif // SYMPTOM_H
