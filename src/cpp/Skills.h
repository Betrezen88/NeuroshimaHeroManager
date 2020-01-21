#ifndef SKILLS_H
#define SKILLS_H

#include <QObject>
#include <QVector>
#include <QQmlListProperty>

#include "Skill.h"

class Skills : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<Skill> skills READ skills NOTIFY skillsChanged)
    Q_PROPERTY(QStringList skillsNames READ skillsNames NOTIFY skillsNamesChanged)
public:
    explicit Skills(QObject *parent = nullptr);

    QQmlListProperty<Skill> skills();
    void appendSkill(Skill*);
    int skillsCount() const;
    Skill *skill(int) const;
    void clearSkills();

    QStringList skillsNames();

signals:
    void skillsChanged();
    void skillsNamesChanged();

private:
    static void appendSkill(QQmlListProperty<Skill>*, Skill*);
    static int skillsCount(QQmlListProperty<Skill>*);
    static Skill *skill(QQmlListProperty<Skill>*, int);
    static void clearSkills(QQmlListProperty<Skill>*);

private:
    QVector<Skill*> m_skills;
    QStringList m_skillsNames;
};

#endif // SKILLS_H
