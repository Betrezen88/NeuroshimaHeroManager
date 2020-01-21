#include "Skillpacks.h"

Skillpacks::Skillpacks(QObject *parent) : QObject(parent)
{

}

QQmlListProperty<Skillpack> Skillpacks::skillpacks()
{
    return QQmlListProperty<Skillpack>(this, this,
                                       &Skillpacks::appendSkillpack,
                                       &Skillpacks::skillpacksCount,
                                       &Skillpacks::skillpack,
                                       &Skillpacks::clearSkillpacks);
}

void Skillpacks::appendSkillpack(Skillpack *skillpack)
{
    m_skillpacks.append(skillpack);
    emit skillpacksChanged();
    m_skillpacksNames.append(skillpack->name());
    emit skillpacksNamesChanged();
}

int Skillpacks::skillpacksCount() const
{
    return m_skillpacks.count();
}

Skillpack *Skillpacks::skillpack(int index) const
{
    return m_skillpacks.at(index);
}

void Skillpacks::clearSkillpacks()
{
    m_skillpacks.clear();
    emit skillpacksChanged();
    m_skillpacksNames.clear();
    emit skillpacksNamesChanged();
}

QStringList Skillpacks::skillpacksNames()
{
    return m_skillpacksNames;
}

void Skillpacks::appendSkillpack(QQmlListProperty<Skillpack> *list, Skillpack *skillpack)
{
    reinterpret_cast<Skillpacks*>(list->data)->appendSkillpack(skillpack);
}

int Skillpacks::skillpacksCount(QQmlListProperty<Skillpack> *list)
{
    return reinterpret_cast<Skillpacks*>(list->data)->skillpacksCount();
}

Skillpack *Skillpacks::skillpack(QQmlListProperty<Skillpack> *list, int index)
{
    return reinterpret_cast<Skillpacks*>(list->data)->skillpack(index);
}

void Skillpacks::clearSkillpacks(QQmlListProperty<Skillpack> *list)
{
    reinterpret_cast<Skillpacks*>(list->data)->clearSkillpacks();
}
