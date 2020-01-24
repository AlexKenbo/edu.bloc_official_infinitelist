import 'package:bloc_official_infinitelist/model/post.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PostState extends Equatable {
  PostState([List props = const <dynamic>[]]) : super(props);
}

/*
* PostUninitialized - сообщит представительному слою, что ему нужно визуализировать индикатор загрузки, пока загружается начальная партия сообщений

* PostLoaded - сообщит слою презентации, что у него есть контент для рендеринга:
* posts - будет тот, List<Post>который будет отображаться
* hasReachedMax- скажет уровень представления, достиг ли он максимального количества постов

* PostError- сообщит на уровне презентации, что при получении сообщений произошла ошибка
*/

class PostUninitialized extends PostState {
  @override
  String toString() => 'PostUninitialized';
}

class PostError extends PostState {
  @override
  String toString() => 'PostError';
}

class PostLoaded extends PostState {
  final List<Post> posts;
  final bool hasReachedMax;

  PostLoaded({
    this.posts,
    this.hasReachedMax,
  }) : super([posts, hasReachedMax]);

  PostLoaded copyWith({
    List<Post> posts,
    bool hasReachedMax,
  }) {
    return PostLoaded(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() =>
      'PostLoaded { posts: ${posts.length}, hasReachedMax: $hasReachedMax }';
}