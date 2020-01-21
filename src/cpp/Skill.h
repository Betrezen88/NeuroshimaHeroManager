#ifndef SKILL_H
#define SKILL_H

#include <QObject>

class Skill: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(int value READ value WRITE setValue NOTIFY valueChanged)
public:
    Skill(QObject *parent = nullptr) : QObject(parent) {}
    Skill(QString name, int value, QObject *parent = nullptr)
        :QObject(parent),
          m_name(name),
          m_value(value)
    {}

    QString name() const { return m_name; }
    int value() const { return m_value; }

signals:
    void valueChanged();

public slots:
    Q_INVOKABLE void setValue(const int value) {
        m_value = value;
        emit valueChanged();
    }
    Q_INVOKABLE void increaseValue(const int value) {
        m_value += value;
        emit valueChanged();
    }

private:
    QString m_name;
    int m_value{0};
};

#endif // SKILL_H
