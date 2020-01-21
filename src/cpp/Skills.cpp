#include "Skills.h"

Skills::Skills(QObject *parent) : QObject(parent)
{

}

QQmlListProperty<Skill> Skills::skills()
{
    return QQmlListProperty<Skill>(this, this,
                                   &Skills::appendSkill,
                                   &Skills::skillsCount,
                                   &Skills::skill,
                                   &Skills::clearSkills);
}

void Skills::appendSkill(Skill *skill)
{
    m_skills.append(skill);
    emit skillsChanged();
    m_skillsNames.append(skill->name());
    emit skillsNamesChanged();
}

int Skills::skillsCount() const
{
    return m_skills.count();
}

Skill *Skills::skill(int index) const
{
    return m_skills.at(index);
}

void Skills::clearSkills()
{
    m_skills.clear();
    emit skillsChanged();
    m_skillsNames.clear();
    emit skillsNamesChanged();
}

QStringList Skills::skillsNames()
{
    return m_skillsNames;
}

void Skills::appendSkill(QQmlListProperty<Skill> *list, Skill *skill)
{
    reinterpret_cast<Skills*>(list->data)->appendSkill(skill);
}

int Skills::skillsCount(QQmlListProperty<Skill> *list)
{
    return reinterpret_cast<Skills*>(list->data)->skillsCount();
}

Skill *Skills::skill(QQmlListProperty<Skill> *list, int index)
{
    return reinterpret_cast<Skills*>(list->data)->skill(index);
}

void Skills::clearSkills(QQmlListProperty<Skill> *list)
{
    reinterpret_cast<Skills*>(list->data)->clearSkills();
}
