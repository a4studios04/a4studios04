import 'package:flame/components.dart'; import 'package:flame/game.dart'; import 'package:flame/input.dart'; import 'package:flutter/material.dart'; import 'package:flutter/services.dart'; import 'package:flame/geometry.dart';

void main() { runApp(GameWidget(game: RacingGame())); }

class RacingGame extends FlameGame with HasCollisionDetection, HasKeyboardHandlerComponents { late Car playerCar; late Background road;

@override Future<void> onLoad() async { road = Background(); playerCar = Car(); add(road); add(playerCar); }

@override bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) { if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) { playerCar.moveLeft(); } else if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) { playerCar.moveRight(); } return true; } }

class Background extends SpriteComponent with HasGameRef<RacingGame> { Background() : super(size: Vector2(800, 1600));

@override Future<void> onLoad() async { sprite = await gameRef.loadSprite('background.jpg'); position = Vector2(0, 0); } }

class Car extends SpriteComponent with HasGameRef<RacingGame>, Hitbox, Collidable { Car() : super(size: Vector2(50, 100));

@override Future<void> onLoad() async { sprite = await gameRef.loadSprite('car.png'); position = Vector2(gameRef.size.x / 2 - size.x / 2, gameRef.size.y - 150); addHitbox(); }

void moveLeft() { if (position.x > 0) { position.x -= 10; } }

void moveRight() { if (position.x < gameRef.size.x - size.x) { position.x += 10; } } }

