other.hp -= damage;
instance_destroy();

var _dano = instance_create_layer(other.x, other.y, "Instances_1", obj_popup);
obj_popup.damage_draw = damage;