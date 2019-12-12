#include "Features.h"

Features::Features(QObject *parent) : QObject(parent)
{

}

QQmlListProperty<Feature> Features::features()
{
    return QQmlListProperty<Feature>(this, this,
                                     &Features::appendFeature,
                                     &Features::featuresCount,
                                     &Features::feature,
                                     &Features::clearFeatures);
}

void Features::appendFeature(Feature *feature)
{
    m_features.append(feature);
    emit featuresChanged();
}

int Features::featuresCount() const
{
    return m_features.count();
}

Feature *Features::feature(int index) const
{
    return m_features.at(index);
}

void Features::clearFeatures()
{
    m_features.clear();
}

void Features::appendFeature(QQmlListProperty<Feature> *list, Feature *feature)
{
    reinterpret_cast<Features*>(list->data)->appendFeature(feature);
}

int Features::featuresCount(QQmlListProperty<Feature> *list)
{
    return reinterpret_cast<Features*>(list->data)->featuresCount();
}

Feature *Features::feature(QQmlListProperty<Feature> *list, int index)
{
    return reinterpret_cast<Features*>(list->data)->feature(index);
}

void Features::clearFeatures(QQmlListProperty<Feature> *list)
{
    reinterpret_cast<Features*>(list->data)->clearFeatures();
}
