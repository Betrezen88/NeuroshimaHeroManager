#ifndef SKILLPACK_H
#define SKILLPACK_H

#include <QObject>
#include <QQmlListProperty>

#include "Skills.h"

class Skillpack: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(QStringList specializations READ specializations CONSTANT)
    Q_PROPERTY(QQmlListProperty<Skill> skills READ skills NOTIFY skillsChanged)
public:
    Skillpack(QObject *parent = nullptr): QObject(parent) {}
    Skillpack(const QString &name,
              const QStringList &specializations,
              QObject *parent = nullptr)
        : QObject(parent),
          m_name(name),
          m_specializations(specializations),
          m_skills(new Skills(this))
    {}

    QString name() const { return m_name; }
    QStringList specializations() const { return m_specializations; }
    QQmlListProperty<Skill> skills() const { return m_skills->skills(); }

signals:
    void skillsChanged();

public slots:
    Q_INVOKABLE void addSkill(Skill *skill) {
        m_skills->appendSkill(skill);
        emit skillsChanged();
    }

private:
    QString m_name;
    QStringList m_specializations;
    Skills *m_skills{nullptr};
};

#endif // SKILLPACK_H
