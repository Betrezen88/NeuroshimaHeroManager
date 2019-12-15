#ifndef FEATUREBONUS_H
#define FEATUREBONUS_H

#include <QObject>
#include <QVariantMap>

class FeatureBonus: public QObject
{
    Q_OBJECT

public:
    FeatureBonus(QObject *parent = nullptr)
        :QObject(parent)
    {
        m_data.insert("type", "text");
    }
    FeatureBonus(const QString &type, QObject *parent = nullptr)
        : QObject(parent)
    {
        m_data.insert("type", type);
    }

    Q_INVOKABLE void addData(const QString &key, const QVariant &value) {
        m_data.insert(key, value);
    }

    Q_INVOKABLE QVariant get(const QString &key) const {
        return m_data.value(key);
    }

private:
    QVariantMap m_data;
};

#endif // FEATUREBONUS_H
