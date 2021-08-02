import 'package:ueab/models/event.dart';
import 'package:ueab/models/ueab.dart';

List<Event> eventData = [
  Event(
      name: 'Candle lighting',
      details: 'Welcoming our new student to this beautiful institution.',
      date: DateTime.now().add(const Duration(days: 2)),
      image:
          'https://ueab.ac.ke/wp-content/uploads/2021/05/IMG_20210512_125545.jpg'),
  Event(
      name: 'Drugs Awareness',
      details: 'Welcoming our new student to this beautiful institution.',
      date: DateTime.now().add(const Duration(days: 2)),
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh2YKNDe6vFSAaZBrd9B6p3aVS8-pJZaW4JHVcr-yaIws2r7CIL-n5Q5ZMXMGZtsPo7fI&usqp=CAU'),
  Event(
      name: 'WOSE',
      details: 'Welcoming our new student to this beautiful institution.',
      date: DateTime.now().add(const Duration(days: 2)),
      image:
          'https://jordan.adventist.org/?service=/modules/encyclopedia/media/getMediaFile&resource=78KD&file=78KDL.jpg'),
];

List<Ueab> homeData = [
  Ueab(
      name: 'Candle lighting',
      details: 'Welcoming our new student to this beautiful institution.',
      image:
          'https://netstorage-tuko.akamaized.net/images/8dab6dbce7357593.jpg?&imwidth=1200'),
  Ueab(
      name: 'Drugs Awareness',
      details: 'Welcoming our new student to this beautiful institution.',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFQwR12YU5_bzEuUdM9JJ6ei-uLdNe0RS1qw&usqp=CAU'),
  Ueab(
      name: 'WOSE',
      details: 'Welcoming our new student to this beautiful institution.',
      image: 'https://pbs.twimg.com/media/E4Evu7IXwAAqmpW.jpg'),
];
