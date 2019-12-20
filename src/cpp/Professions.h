#ifndef PROFESSIONS_H
#define PROFESSIONS_H

#include <QObject>
#include <QVector>
#include <QQmlListProperty>

#include "Profession.h"
#include "FeatureBonus.h"

class Professions : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<Profession> professions READ professions NOTIFY professionsChanged)
    Q_PROPERTY(QStringList professionsNames READ professionsNames NOTIFY professionsNamesChanged)
public:
    explicit Professions(QObject *parent = nullptr);

    QQmlListProperty<Profession> professions();
    void appendProfession(Profession*);
    int professionsCount() const;
    Profession *profession(int) const;
    void clearProfessions();

    QStringList professionsNames();

signals:
    void professionsChanged();
    void professionsNamesChanged();

public slots:
    Q_INVOKABLE void loadProfessions(const QString &filePath);

private:
    FeatureBonus *createFeatureBonus(const QJsonObject &bonus);
    static void appendProfession(QQmlListProperty<Profession>*, Profession*);
    static int professionsCount(QQmlListProperty<Profession>*);
    static Profession *profession(QQmlListProperty<Profession> *list, int index);
    static void clearProfessions(QQmlListProperty<Profession>*);

private:
    QVector<Profession*> m_professions;
    QStringList m_professionsNames;
};

#endif // PROFESSIONS_H
