#ifndef ORIGIN_H
#define ORIGIN_H

#include <QObject>
#include <QQmlListProperty>

#include "AttributeBonus.h"
#include "Features.h"

class Origin : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(QString description READ description CONSTANT)
    Q_PROPERTY(QString image READ image CONSTANT)
    Q_PROPERTY(AttributeBonus* bonus READ bonus CONSTANT)
    Q_PROPERTY(QQmlListProperty<Feature> features READ features)
public:
    Origin(QObject *parent = nullptr) : QObject(parent) {}
    Origin(const QString &name,
           const QString &description,
           const QString &image,
           AttributeBonus *bonus,
           QObject *parent = nullptr)
        : QObject(parent),
          m_name(name),
          m_description(description),
          m_image(image),
          m_features(new Features(this)),
          m_bonus(bonus)
    {}

    QString name() const { return m_name; }
    QString description() const { return m_description; }
    QString image() const { return m_image; }
    QQmlListProperty<Feature> features() const { return m_features->features(); }
    AttributeBonus *bonus() const { return m_bonus; }

    void addFeature(Feature *feature) {
        m_features->appendFeature(feature);
    }

private:
    QString m_name;
    QString m_description;
    QString m_image;
    Features *m_features{nullptr};
    AttributeBonus *m_bonus{nullptr};
};

#endif // ORIGIN_H
