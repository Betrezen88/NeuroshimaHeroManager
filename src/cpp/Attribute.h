#ifndef ATTRIBUTE_H
#define ATTRIBUTE_H

#include <QObject>
#include <QQmlListProperty>

#include "AttributeBonus.h"
#include "Skillpacks.h"

class Attribute: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(int value READ value NOTIFY valueChanged)
    Q_PROPERTY(QQmlListProperty<Skillpack> skillpacks READ skillpacks NOTIFY skillpacksChanged)
public:
    Attribute(QObject *parent = nullptr): QObject(parent) {}
    Attribute(const QString &name,
              int value,
              QObject *parent = nullptr)
        : QObject(parent),
          m_name(name),
          m_value(value),
          m_skillpacks(new Skillpacks(this))
    {}

    QString name() const { return m_name; }
    int value() const {
        if ( m_bonus != nullptr )
            return m_value + m_bonus->value();
        return m_value;
    }
    QQmlListProperty<Skillpack> skillpacks() { return m_skillpacks->skillpacks(); }

signals:
    void valueChanged();
    void skillpacksChanged();

public slots:
    Q_INVOKABLE void addBonus(AttributeBonus *bonus) {
        if ( m_name == bonus->name() ) {
            m_bonus = bonus;
            emit valueChanged();
        }
    }
    Q_INVOKABLE void addSkillpack(Skillpack *skillpack) {
        m_skillpacks->appendSkillpack(skillpack);
        emit skillpacksChanged();
    }

private:
    QString m_name;
    int m_value{0};
    AttributeBonus *m_bonus{nullptr};
    Skillpacks *m_skillpacks{nullptr};
};

#endif // ATTRIBUTE_H
