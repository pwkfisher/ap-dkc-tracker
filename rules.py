from typing import Dict, TYPE_CHECKING
if TYPE_CHECKING:
    from . import DKCWorld

from .Names import LocationName, ItemName, RegionName, EventName

from worlds.generic.Rules import CollectionRule
from BaseClasses import CollectionState
  
class DKCRules:
    player: int
    world: "DKCWorld"
    connection_rules: Dict[str, CollectionRule]
    region_rules: Dict[str, CollectionRule]
    location_rules: Dict[str, CollectionRule]

    def __init__(self, world: "DKCWorld") -> None:
        self.player = world.player
        self.world = world

        self.connection_rules = {
            f"{RegionName.dk_isle} -> {RegionName.kongo_jungle}":
                self.can_access_jungle,
            f"{RegionName.dk_isle} -> {RegionName.monkey_mines}":
                self.can_access_mines,
            f"{RegionName.dk_isle} -> {RegionName.vine_valley}":
                self.can_access_valley,
            f"{RegionName.dk_isle} -> {RegionName.gorilla_glacier}":
                self.can_access_glacier,
            f"{RegionName.dk_isle} -> {RegionName.kremkroc_industries}":
                self.can_access_industries,
            f"{RegionName.dk_isle} -> {RegionName.chimp_caverns}":
                self.can_access_caverns,
            f"{RegionName.dk_isle} -> {RegionName.gangplank_galleon}":
                self.can_access_ship,
        }

    def can_access_jungle(self, state: CollectionState) -> bool:
        return state.has(ItemName.kongo_jungle, self.player)

    def can_access_mines(self, state: CollectionState) -> bool:
        return state.has(ItemName.monkey_mines, self.player)

    def can_access_valley(self, state: CollectionState) -> bool:
        return state.has(ItemName.vine_valley, self.player)

    def can_access_glacier(self, state: CollectionState) -> bool:
        return state.has(ItemName.gorilla_glacier, self.player)

    def can_access_industries(self, state: CollectionState) -> bool:
        return state.has(ItemName.kremkroc_industries, self.player)

    def can_access_caverns(self, state: CollectionState) -> bool:
        return state.has(ItemName.chimp_caverns, self.player)
    
    def can_access_ship(self, state: CollectionState) -> bool:
        return state.has(ItemName.boss_token, self.player, self.world.options.gangplank_tokens.value)

    def has_donkey(self, state: CollectionState) -> bool:
        return state.has(ItemName.donkey, self.player)

    def has_diddy(self, state: CollectionState) -> bool:
        return state.has(ItemName.diddy, self.player)
    
    def has_both_kongs(self, state: CollectionState) -> bool:
        return state.has_all({ItemName.donkey, ItemName.diddy}, self.player)
    
    def can_carry(self, state: CollectionState) -> bool:
        return state.has(ItemName.carry, self.player)
    
    def can_swim(self, state: CollectionState) -> bool:
        return state.has(ItemName.swim, self.player)
    
    def can_roll(self, state: CollectionState) -> bool:
        return state.has(ItemName.roll, self.player)
    
    def can_climb(self, state: CollectionState) -> bool:
        return state.has(ItemName.climb, self.player)
    
    def can_slap(self, state: CollectionState) -> bool:
        return state.has_all({ItemName.donkey, ItemName.slap}, self.player)
    
    def has_kannons(self, state: CollectionState) -> bool:
        return state.has(ItemName.kannons, self.player)
    
    def has_switches(self, state: CollectionState) -> bool:
        return state.has(ItemName.switches, self.player)
    
    def has_minecart(self, state: CollectionState) -> bool:
        return state.has(ItemName.minecart, self.player)
    
    def has_winky(self, state: CollectionState) -> bool:
        return state.has(ItemName.winky, self.player)
    
    def has_expresso(self, state: CollectionState) -> bool:
        return state.has(ItemName.expresso, self.player)
    
    def has_rambi(self, state: CollectionState) -> bool:
        return state.has(ItemName.rambi, self.player)
    
    def has_enguarde(self, state: CollectionState) -> bool:
        return state.has(ItemName.enguarde, self.player)
    
    def has_squawks(self, state: CollectionState) -> bool:
        return state.has(ItemName.squawks, self.player)
    
    def has_tires(self, state: CollectionState) -> bool:
        return state.has(ItemName.tires, self.player)
    
    def has_platforms(self, state: CollectionState) -> bool:
        return state.has(ItemName.platforms, self.player)
    
    def true(self, state: CollectionState) -> bool:
        return True
    
    def set_dkc_rules(self) -> None:
        multiworld = self.world.multiworld

        for entrance_name, rule in self.connection_rules.items():
            entrance = multiworld.get_entrance(entrance_name, self.player)
            entrance.access_rule = rule
        for loc in multiworld.get_locations(self.player):
            if loc.name in self.location_rules:
                loc.access_rule = self.location_rules[loc.name]
            
        multiworld.completion_condition[self.player] = lambda state: state.has(EventName.k_rool, self.player)
        
            

class DKCStrictRules(DKCRules):
    def __init__(self, world: "DKCWorld") -> None:
        super().__init__(world)

        self.location_rules = {
            LocationName.jungle_hijinxs_balloon_1:
                self.has_tires,
            LocationName.jungle_hijinxs_bunch_4:
                self.can_roll,
            LocationName.jungle_hijinxs_balloon_2:
                self.can_roll,
            LocationName.jungle_hijinxs_bunch_8:
                self.can_slap,
            LocationName.jungle_hijinxs_bunch_10:
                self.can_slap,
            LocationName.jungle_hijinxs_bunch_11:
                self.can_slap,
            LocationName.jungle_hijinxs_bunch_12:
                self.true,
            LocationName.jungle_hijinxs_balloon_3:
                lambda state: self.can_roll(state) and self.has_diddy(state),
            LocationName.jungle_hijinxs_bunch_13:
                lambda state: self.can_roll(state) and self.can_slap(state),
            LocationName.jungle_hijinxs_balloon_4:
                lambda state: self.can_roll(state) and self.has_diddy(state),
            LocationName.jungle_hijinxs_token_1:
                self.true,
            LocationName.jungle_hijinxs_bunch_15:
                self.can_slap,
            LocationName.jungle_hijinxs_bunch_17:
                self.can_slap,
            LocationName.jungle_hijinxs_bunch_18:
                self.can_slap,

        }

class DKCLooseRules(DKCRules):
    def __init__(self, world: "DKCWorld") -> None:
        super().__init__(world)

        self.location_rules = {
            LocationName.jungle_hijinxs_balloon_1:
                self.has_tires,
            LocationName.jungle_hijinxs_bunch_2:
                lambda state: self.has_rambi(state) or self.can_slap(state),
            LocationName.jungle_hijinxs_bunch_3:
                lambda state: self.has_rambi(state) or self.can_slap(state),
            LocationName.jungle_hijinxs_bunch_4:
                lambda state: self.has_rambi(state) or self.can_roll(state),
            LocationName.jungle_hijinxs_bunch_5:
                lambda state: self.has_rambi(state) or self.can_slap(state),
            LocationName.jungle_hijinxs_bunch_8:
                lambda state: self.has_rambi(state) or self.can_slap(state),
            LocationName.jungle_hijinxs_bunch_10:
                lambda state: self.has_rambi(state) or self.can_slap(state),
            LocationName.jungle_hijinxs_bunch_13:
                lambda state: self.can_roll(state) and self.can_slap(state),
            LocationName.jungle_hijinxs_bunch_15:
                lambda state: self.has_rambi(state) or self.can_slap(state),
            LocationName.jungle_hijinxs_bunch_17:
                lambda state: self.has_rambi(state) or self.can_slap(state),
            LocationName.jungle_hijinxs_bunch_18:
                lambda state: self.has_rambi(state) or self.can_slap(state),


        }

    def set_dkc_rules(self) -> None:
        super().set_dkc_rules()


class DKCExpertRules(DKCRules):
    def __init__(self, world: "DKCWorld") -> None:
        super().__init__(world)

        self.location_rules = {
        }

    def set_dkc_rules(self) -> None:
        super().set_dkc_rules()
