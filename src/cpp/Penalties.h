#ifndef PENALTIES_H
#define PENALTIES_H

#include <QObject>
#include <QVector>
#include <QQmlListProperty>

#include "Penalty.h"

class Penalties : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<Penalty> penalties READ penalties NOTIFY penaltiesChanged)
public:
    explicit Penalties(QObject *parent = nullptr);

    QQmlListProperty<Penalty> penalties();
    void appendPenalty(Penalty*);
    int penaltiesCount() const;
    Penalty *penalty(int) const;
    void clearPenalties();

signals:
    void penaltiesChanged();

private:
    static void appendPenalty(QQmlListProperty<Penalty>*, Penalty*);
    static int penaltiesCount(QQmlListProperty<Penalty>*);
    static Penalty *penalty(QQmlListProperty<Penalty>*, int);
    static void clearPenalties(QQmlListProperty<Penalty>*);

private:
    QVector<Penalty*> m_penalties;
};

#endif // PENALTIES_H
