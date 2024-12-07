import 'package:flutter/material.dart';

class ApplicationDetails extends StatelessWidget {
  const ApplicationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали заказа'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Блок 1: Текст в две колонки
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTwoColumnText('Статус', 'Активный'),
                  _buildTwoColumnText('Тип заявки', 'Доставка'),
                  _buildTwoColumnText('Ожидаемое время', '09:00 - 18:00'),
                  _buildTwoColumnText('Клиент', 'Петр Иванов'),
                  _buildTwoColumnText('Создан', 'Диспетчер'),
                  _buildTwoColumnText('Дополнительно', 'Не указано'),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey.shade300),

            // Блок 2: Адрес и кнопка "Выехать"
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Ряд с адресом
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'г. Алматы, ул. Абая, 10',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Не указано',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.arrow_forward_ios, size: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Кнопка "Выехать"
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48), backgroundColor: Colors.blue,
                    ),
                    child: const Text('Выехать'),
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey.shade300),

            // Блок 3: Пункты с иконками и текстом
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildActionRow(Icons.calculate, 'Данные цены'),
                  Divider(height: 1, color: Colors.grey.shade300),
                  _buildActionRow(Icons.inventory, 'Данные товара'),
                  Divider(height: 1, color: Colors.grey.shade300),
                  _buildActionRow(Icons.chat, 'Начать чат с диспетчером'),
                  Divider(height: 1, color: Colors.grey.shade300),
                  _buildActionRow(Icons.camera_alt, 'Отправить медиа'),
                  Divider(height: 1, color: Colors.grey.shade300),
                  _buildActionRow(Icons.phone, 'Позвонить клиенту'),
                  Divider(height: 1, color: Colors.grey.shade300),
                  _buildActionRow(Icons.description, 'Дополнительные данные'),
                  Divider(height: 1, color: Colors.grey.shade300),
                  _buildActionRow(Icons.comment, 'Добавить комментарий'),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Кнопки "Отказать" и "Завершить"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: const Size(double.infinity, 48),
                      ),
                      child: const Text('Отказать'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(double.infinity, 48),
                      ),
                      child: const Text('Завершить'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // Виджет для текстовых строк в 2 колонки
  Widget _buildTwoColumnText(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  // Виджет для пунктов с иконкой и текстом
  Widget _buildActionRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.blue),
          const SizedBox(width: 16),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
