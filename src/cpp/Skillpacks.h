#ifndef SKILLPACKS_H
#define SKILLPACKS_H

#include <QObject>
#include <QVector>
#include <QQmlListProperty>

#include "Skillpack.h"

class Skillpacks : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<Skillpack> skillpacks READ skillpacks NOTIFY skillpacksChanged)
    Q_PROPERTY(QStringList skillpacksNames READ skillpacksNames NOTIFY skillpacksNamesChanged)
public:
    explicit Skillpacks(QObject *parent = nullptr);

    QQmlListProperty<Skillpack> skillpacks();
    void appendSkillpack(Skillpack *);
    int skillpacksCount() const;
    Skillpack *skillpack(int) const;
    void clearSkillpacks();

    QStringList skillpacksNames();

signals:
    void skillpacksChanged();
    void skillpacksNamesChanged();

private:
    static void appendSkillpack(QQmlListProperty<Skillpack>*, Skillpack*);
    static int skillpacksCount(QQmlListProperty<Skillpack>*);
    static Skillpack *skillpack(QQmlListProperty<Skillpack>*, int);
    static void clearSkillpacks(QQmlListProperty<Skillpack>*);

private:
    QVector<Skillpack*> m_skillpacks;
    QStringList m_skillpacksNames;
};

#endif // SKILLPACKS_H
