#ifndef SPECIALIZATIONS_H
#define SPECIALIZATIONS_H

#include <QObject>
#include <QVector>
#include <QQmlListProperty>

#include "Specialization.h"

class Specializations : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<Specialization> specializations READ specializations NOTIFY specializationsChanged)
    Q_PROPERTY(QStringList specializationsNames READ specializationsNames NOTIFY specializationsNamesChanged)
public:
    explicit Specializations(QObject *parent = nullptr);

    QQmlListProperty<Specialization> specializations();
    void appendSpecialization(Specialization*);
    int specializationsCount() const;
    Specialization *specialization(int) const;
    void clearSpecializations();

    QStringList specializationsNames();

signals:
    void specializationsChanged();
    void specializationsNamesChanged();

public slots:
    Q_INVOKABLE void loadSpecializations(const QString &filePath);

private:
    static void appendSpecialization(QQmlListProperty<Specialization>*, Specialization*);
    static int specializationsCount(QQmlListProperty<Specialization>*);
    static Specialization *specialization(QQmlListProperty<Specialization>*, int);
    static void clearSpecializations(QQmlListProperty<Specialization>*);

private:
    QVector<Specialization*> m_specializations;
    QStringList m_specializationsNames;
};

#endif // SPECIALIZATIONS_H
