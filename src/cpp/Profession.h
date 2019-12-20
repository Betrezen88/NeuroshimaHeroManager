#ifndef PROFESSION_H
#define PROFESSION_H

#include <QObject>
#include <QQmlListProperty>

#include "Features.h"

class Profession: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(QString description READ description CONSTANT)
    Q_PROPERTY(QString quote READ quote CONSTANT)
    Q_PROPERTY(QString image READ image CONSTANT)
    Q_PROPERTY(QQmlListProperty<Feature> features READ features)
public:
    Profession(QObject *parent = nullptr): QObject(parent) {}
    Profession(const QString &name,
               const QString &description,
               const QString &quote,
               const QString &image,
               QObject *parent = nullptr)
        : QObject(parent),
          m_name(name),
          m_description(description),
          m_quote(quote),
          m_image(image),
          m_features(new Features(this))
    {}

    QString name() const { return m_name; }
    QString description() const { return m_description; }
    QString quote() const { return m_quote; }
    QString image() const { return m_image; }
    QQmlListProperty<Feature> features() const { return m_features->features(); }

    void addFeature(Feature *feature) {
        m_features->appendFeature(feature);
    }

private:
    QString m_name;
    QString m_description;
    QString m_quote;
    QString m_image;
    Features *m_features{nullptr};
};

#endif // PROFESSION_H
