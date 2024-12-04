import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Блок 1: Информация о профиле
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Картинка профиля
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.grey.shade300,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // ФИО
                  const Text(
                    'Иван Иванов',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // Телефон
                  Text(
                    '+7 777 123 45 67',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 8),
                  // Email
                  Text(
                    'ivan.ivanov@example.com',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey.shade300),

            // Блок 2: Кнопки
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  _buildProfileButton(
                    context,
                    icon: Icons.calculate,
                    text: 'Посмотреть статистику',
                    onPressed: () {
                      // Действие для кнопки статистики
                    },
                  ),
                  _buildProfileButton(
                    context,
                    icon: Icons.account_balance_wallet,
                    text: 'Посмотреть кассу',
                    onPressed: () {
                      // Действие для кнопки кассы
                    },
                  ),
                  _buildProfileButton(
                    context,
                    icon: Icons.chat,
                    text: 'Помощь',
                    onPressed: () {
                      // Действие для кнопки помощи
                    },
                  ),
                  const SizedBox(height: 16),
                  // Кнопка "Выйти"
                  _buildProfileButton(
                    context,
                    icon: Icons.exit_to_app,
                    text: 'Выйти',
                    onPressed: () {
                      // Действие для кнопки выхода
                    },
                    isPrimary: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Функция для создания кнопок
  Widget _buildProfileButton(
    BuildContext context, {
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
    bool isPrimary = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: isPrimary ? 0 : 8),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: isPrimary ? Colors.white : Colors.blue,
        ),
        label: Text(
          text,
          style: TextStyle(
            color: isPrimary ? Colors.white : Colors.blue,
            fontSize: 16,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? Colors.red : Colors.grey.shade200,
          minimumSize: const Size(double.infinity, 48),
          elevation: 0,
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }
}
