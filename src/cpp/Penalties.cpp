#include "Penalties.h"

Penalties::Penalties(QObject *parent) : QObject(parent)
{

}

QQmlListProperty<Penalty> Penalties::penalties()
{
    return QQmlListProperty<Penalty>(this, this,
                                     &Penalties::appendPenalty,
                                     &Penalties::penaltiesCount,
                                     &Penalties::penalty,
                                     &Penalties::clearPenalties);
}

void Penalties::appendPenalty(Penalty *penalty)
{
    m_penalties.push_back(penalty);
    penaltiesChanged();
}

int Penalties::penaltiesCount() const
{
    return m_penalties.count();
}

Penalty *Penalties::penalty(int index) const
{
    return m_penalties.at(index);
}

void Penalties::clearPenalties()
{
    m_penalties.clear();
    penaltiesChanged();
}

void Penalties::appendPenalty(QQmlListProperty<Penalty> *list, Penalty *penalty)
{
    reinterpret_cast<Penalties*>(list->data)->appendPenalty(penalty);
}

int Penalties::penaltiesCount(QQmlListProperty<Penalty> *list)
{
    return reinterpret_cast<Penalties*>(list->data)->penaltiesCount();
}

Penalty *Penalties::penalty(QQmlListProperty<Penalty> *list, int index)
{
    return reinterpret_cast<Penalties*>(list->data)->penalty(index);
}

void Penalties::clearPenalties(QQmlListProperty<Penalty> *list)
{
    reinterpret_cast<Penalties*>(list->data)->clearPenalties();
}
