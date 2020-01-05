#ifndef DISEASES_H
#define DISEASES_H

#include <QObject>
#include <QVector>
#include <QQmlListProperty>

#include "Disease.h"

class Diseases : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<Disease> diseases READ diseases NOTIFY diseasesChanged)
    Q_PROPERTY(QStringList diseasesNames READ diseasesNames NOTIFY diseasesNamesChanged)
public:
    explicit Diseases(QObject *parent = nullptr);

    QQmlListProperty<Disease> diseases();
    void appendDisease(Disease*);
    int diseasesCount() const;
    Disease *disease(int) const;
    void clearDiseases();

    QStringList diseasesNames();

signals:
    void diseasesChanged();
    void diseasesNamesChanged();

public slots:
    Q_INVOKABLE void loadDiseases(const QString &filePath);

private:
    static void appendDisease(QQmlListProperty<Disease>*, Disease*);
    static int diseasesCount(QQmlListProperty<Disease>*);
    static Disease *disease(QQmlListProperty<Disease>*, int);
    static void clearDiseases(QQmlListProperty<Disease>*);

private:
    QVector<Disease*> m_diseases;
    QStringList m_diseasesNames;
};

#endif // DISEASES_H
