#ifndef FEATURES_H
#define FEATURES_H

#include <QObject>
#include <QVector>
#include <QQmlListProperty>

#include "Feature.h"

class Features : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<Feature> features READ features NOTIFY featuresChanged)
public:
    explicit Features(QObject *parent = nullptr);

    QQmlListProperty<Feature> features();
    void appendFeature(Feature*);
    int featuresCount() const;
    Feature *feature(int) const;
    void clearFeatures();

signals:
    void featuresChanged();

private:
    static void appendFeature(QQmlListProperty<Feature>*, Feature*);
    static int featuresCount(QQmlListProperty<Feature>*);
    static Feature *feature(QQmlListProperty<Feature>*, int);
    static void clearFeatures(QQmlListProperty<Feature>*);

private:
    QVector<Feature*> m_features;
};

#endif // FEATURES_H
