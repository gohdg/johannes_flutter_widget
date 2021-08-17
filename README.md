# widget_tutorial

A Checkbox Widget.
Checkbox(
value: notification.value,
onChanged: (value) {
onClicked();
})

A ListTile Widget.
ListTile(
onTap: onClicked,
leading: Checkbox(
value: notification.value,
onChanged: (value) {
onClicked();
}),
title: Text(
notification.title!,
style: TextStyle(
fontSize: 20,
fontWeight: FontWeight.bold,
),
),
);

## Getting Started

List spread operator ... 다트에서도 spread operator를 사용한다.
