# Quick Start Guide

## Running the Game
1. Open the project in Godot 4.3
2. Press F5 or click "Run Project"
3. The game will start at Level 1

## Game Controls
- **Move**: A/D or Arrow Keys
- **Jump**: W/Space/Up Arrow
- **Attack**: E or Left Mouse Button

## Objective
Reach the red X button in the top-right corner to win!

## System Components

### ✅ Player System
- Movement (WASD/Arrows)
- Jump mechanics
- Health system (100 HP)
- Attack system (E/Mouse)
- Damage feedback
- Auto-respawn on death

### ✅ Enemies
- Walking enemies (patrol ground)
- Flying enemies (air patrol)
- Damage on contact
- Can be killed for score points
- Configurable in Inspector

### ✅ Moving Platforms
- Horizontal movement
- Vertical movement
- Configurable speed/distance
- Player can ride them

### ✅ Hazards
1. **Fire Walls** - Spinning fire obstacles
2. **Fire Shooters** - Turrets that shoot fireballs
3. **Fireballs** - Projectile hazards
4. **Spikes** - Ground traps

### ✅ Collectibles
- Health Pickups (green orbs)
- Restore 25 HP each

### ✅ UI System
- Health Bar (visual + numbers)
- Score Counter
- Timer (MM:SS format)

### ✅ Goal System
- Red X button (exit)
- Positioned at top-right
- Triggers level transition

## Customization Tips

### Adjust Enemy Difficulty
Select enemy in scene → Inspector:
- `move_speed`: How fast it moves
- `move_distance`: Patrol range
- `damage`: Damage to player
- `score_value`: Points when killed
- `enemy_type`: "walking" or "flying"

### Modify Platform Behavior
Select platform → Inspector:
- `move_distance`: How far it travels
- `move_speed`: Movement speed
- `direction`: Vector2(x, y) direction

### Configure Fire Shooter
Select fire shooter → Inspector:
- `shoot_interval`: Time between shots
- `fireball_speed`: Projectile speed
- `shoot_direction`: Vector2(x, y) aim

### Adjust Player Stats
Select player → Inspector:
- `max_health`: Maximum HP
- `current_health`: Starting HP
- `SPEED`: Movement speed
- `JUMP_VELOCITY`: Jump power

## Level Design Checklist
- [ ] Place player spawn point (low left)
- [ ] Add floor and walls
- [ ] Create platform path to top-right
- [ ] Add 2-3 moving platforms
- [ ] Place 2-3 enemies
- [ ] Add hazards (fire/spikes)
- [ ] Place health pickups strategically
- [ ] Position exit button at top-right
- [ ] Test complete path
- [ ] Adjust difficulty

## Common Issues & Solutions

**Player falls through platforms**
→ Check collision layers are set correctly

**Enemies don't damage player**
→ Ensure enemy Hitbox has collision mask = 1

**Attack doesn't kill enemies**
→ Make sure enemies are on collision layer 2

**UI doesn't update**
→ Check signal connections in game_manager.gd

**Fire shooter doesn't shoot**
→ Fireball scene must exist at res://scenes/hazards/fireball.tscn

## File Structure
```
scenes/
  ├── player/player.tscn
  ├── enemies/enemy.tscn
  ├── platforms/moving_platform.tscn
  ├── hazards/ (fire_wall, fire_shooter, fireball, spikes)
  ├── collectibles/health_pickup.tscn
  ├── ui/game_ui.tscn
  └── levels/ (exit_button, level_1)

scripts/ (matching .gd files for each scene)
```

## Next Steps
1. ✅ All Level 1 features implemented
2. Create Level 2 (duplicate level_1.tscn)
3. Add particle effects
4. Implement sound effects
5. Create more enemy types
6. Add power-ups
7. Design checkpoint system

---
**Project Status**: Level 1 Complete ✅
All requested features implemented and ready to test!
