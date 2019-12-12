#ifndef FEATURE_H
#define FEATURE_H

#include <QObject>

#include "FeatureBonus.h"

class Feature : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(QString description READ description CONSTANT)
    Q_PROPERTY(FeatureBonus* bonus READ bonus CONSTANT)
public:
    Feature(QObject *parent = nullptr): QObject(parent) {}
    Feature(const QString &name,
            const QString &description,
            FeatureBonus *bonus,
            QObject *parent = nullptr)
        : QObject(parent),
          m_name(name),
          m_description(description),
          m_bonus(bonus)
    {}

    QString name() const { return m_name; }
    QString description() const { return m_description; }
    FeatureBonus *bonus() const { return m_bonus; }

private:
    QString m_name;
    QString m_description;
    FeatureBonus *m_bonus{nullptr};
};

#endif // FEATURE_H
