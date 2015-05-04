# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150504143259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account", force: :cascade do |t|
    t.string   "username",        limit: 32,  default: "",          null: false
    t.string   "sha_pass_hash",   limit: 40,  default: "",          null: false
    t.string   "sessionkey",      limit: 80,  default: "",          null: false
    t.string   "v",               limit: 64,  default: "",          null: false
    t.string   "s",               limit: 64,  default: "",          null: false
    t.string   "token_key",       limit: 100, default: "",          null: false
    t.string   "email",           limit: 255, default: "",          null: false
    t.string   "reg_mail",        limit: 255, default: "",          null: false
    t.datetime "joindate"
    t.string   "last_ip",         limit: 15,  default: "127.0.0.1", null: false
    t.string   "last_attempt_ip", limit: 15,  default: "127.0.0.1", null: false
    t.integer  "failed_logins",               default: 0,           null: false
    t.integer  "locked",          limit: 2,   default: 0,           null: false
    t.string   "lock_country",    limit: 2,   default: "00",        null: false
    t.datetime "last_login"
    t.integer  "online",          limit: 2,   default: 0,           null: false
    t.integer  "expansion",       limit: 2,   default: 2,           null: false
    t.integer  "mutetime",        limit: 8,   default: 0,           null: false
    t.string   "mutereason",      limit: 255, default: "",          null: false
    t.string   "muteby",          limit: 50,  default: "",          null: false
    t.integer  "locale",          limit: 2,   default: 0,           null: false
    t.string   "os",              limit: 3,   default: "",          null: false
    t.integer  "recruiter",                   default: 0,           null: false
  end

  add_index "account", ["username"], name: "idx_username", unique: true, using: :btree

  create_table "account_access", id: false, force: :cascade do |t|
    t.integer "id",                             null: false
    t.integer "gmlevel", limit: 2,              null: false
    t.integer "RealmID",           default: -1, null: false
  end

  create_table "account_banned", id: false, force: :cascade do |t|
    t.integer "id",                    default: 0, null: false
    t.integer "bandate",               default: 0, null: false
    t.integer "unbandate",             default: 0, null: false
    t.string  "bannedby",  limit: 50,              null: false
    t.string  "banreason", limit: 255,             null: false
    t.integer "active",    limit: 2,   default: 1, null: false
  end

  create_table "account_data", id: false, force: :cascade do |t|
    t.integer "accountId",           default: 0, null: false
    t.integer "type",      limit: 2, default: 0, null: false
    t.integer "time",                default: 0, null: false
    t.binary  "data",                            null: false
  end

  create_table "account_instance_times", id: false, force: :cascade do |t|
    t.integer "accountId",                         null: false
    t.integer "instanceId",            default: 0, null: false
    t.integer "releaseTime", limit: 8, default: 0, null: false
  end

  create_table "account_muted", id: false, force: :cascade do |t|
    t.integer "guid",                   default: 0, null: false
    t.integer "mutedate",               default: 0, null: false
    t.integer "mutetime",               default: 0, null: false
    t.string  "mutedby",    limit: 50,              null: false
    t.string  "mutereason", limit: 255,             null: false
  end

  create_table "account_tutorial", primary_key: "accountId", force: :cascade do |t|
    t.integer "tut0", default: 0, null: false
    t.integer "tut1", default: 0, null: false
    t.integer "tut2", default: 0, null: false
    t.integer "tut3", default: 0, null: false
    t.integer "tut4", default: 0, null: false
    t.integer "tut5", default: 0, null: false
    t.integer "tut6", default: 0, null: false
    t.integer "tut7", default: 0, null: false
  end

  create_table "addons", primary_key: "name", force: :cascade do |t|
    t.integer "crc", default: 0, null: false
  end

  create_table "arena_team", primary_key: "arenaTeamId", force: :cascade do |t|
    t.string  "name",            limit: 24,             null: false
    t.integer "captainGuid",                default: 0, null: false
    t.integer "type",            limit: 2,  default: 0, null: false
    t.integer "rating",          limit: 2,  default: 0, null: false
    t.integer "seasonGames",     limit: 2,  default: 0, null: false
    t.integer "seasonWins",      limit: 2,  default: 0, null: false
    t.integer "weekGames",       limit: 2,  default: 0, null: false
    t.integer "weekWins",        limit: 2,  default: 0, null: false
    t.integer "rank",                       default: 0, null: false
    t.integer "backgroundColor",            default: 0, null: false
    t.integer "emblemStyle",     limit: 2,  default: 0, null: false
    t.integer "emblemColor",                default: 0, null: false
    t.integer "borderStyle",     limit: 2,  default: 0, null: false
    t.integer "borderColor",                default: 0, null: false
  end

  create_table "arena_team_member", id: false, force: :cascade do |t|
    t.integer "arenaTeamId",              default: 0, null: false
    t.integer "guid",                     default: 0, null: false
    t.integer "weekGames",      limit: 2, default: 0, null: false
    t.integer "weekWins",       limit: 2, default: 0, null: false
    t.integer "seasonGames",    limit: 2, default: 0, null: false
    t.integer "seasonWins",     limit: 2, default: 0, null: false
    t.integer "personalRating", limit: 2, default: 0, null: false
  end

  create_table "auctionhouse", force: :cascade do |t|
    t.integer "auctioneerguid", default: 0, null: false
    t.integer "itemguid",       default: 0, null: false
    t.integer "itemowner",      default: 0, null: false
    t.integer "buyoutprice",    default: 0, null: false
    t.integer "time",           default: 0, null: false
    t.integer "buyguid",        default: 0, null: false
    t.integer "lastbid",        default: 0, null: false
    t.integer "startbid",       default: 0, null: false
    t.integer "deposit",        default: 0, null: false
  end

  create_table "autobroadcast", id: false, force: :cascade do |t|
    t.integer "realmid",           default: -1, null: false
    t.integer "id",      limit: 2,              null: false
    t.integer "weight",  limit: 2, default: 1
    t.text    "text",                           null: false
  end

  create_table "banned_addons", primary_key: "Id", force: :cascade do |t|
    t.string   "Name",      limit: 255,              null: false
    t.string   "Version",   limit: 255, default: "", null: false
    t.datetime "Timestamp",                          null: false
  end

  create_table "bugreport", force: :cascade do |t|
    t.text "type",    null: false
    t.text "content", null: false
  end

  create_table "calendar_events", force: :cascade do |t|
    t.integer "creator",                 default: 0,     null: false
    t.string  "title",       limit: 255, default: "",    null: false
    t.string  "description", limit: 255, default: "",    null: false
    t.boolean "type",                    default: false, null: false
    t.integer "dungeon",                 default: -1,    null: false
    t.integer "eventtime",               default: 0,     null: false
    t.integer "flags",                   default: 0,     null: false
    t.integer "time2",                   default: 0,     null: false
  end

  create_table "calendar_invites", force: :cascade do |t|
    t.integer "event",      limit: 8,   default: 0,     null: false
    t.integer "invitee",                default: 0,     null: false
    t.integer "sender",                 default: 0,     null: false
    t.boolean "status",                 default: false, null: false
    t.integer "statustime",             default: 0,     null: false
    t.boolean "rank",                   default: false, null: false
    t.string  "text",       limit: 255, default: "",    null: false
  end

  create_table "channels", id: false, force: :cascade do |t|
    t.string  "name",       limit: 128,             null: false
    t.integer "team",                               null: false
    t.integer "announce",   limit: 2,   default: 1, null: false
    t.integer "ownership",  limit: 2,   default: 1, null: false
    t.string  "password",   limit: 32
    t.text    "bannedList"
    t.integer "lastUsed",                           null: false
  end

  create_table "character_account_data", id: false, force: :cascade do |t|
    t.integer "guid",           default: 0, null: false
    t.integer "type", limit: 2, default: 0, null: false
    t.integer "time",           default: 0, null: false
    t.binary  "data",                       null: false
  end

  create_table "character_achievement", id: false, force: :cascade do |t|
    t.integer "guid",                              null: false
    t.integer "achievement", limit: 2,             null: false
    t.integer "date",                  default: 0, null: false
  end

  create_table "character_achievement_progress", id: false, force: :cascade do |t|
    t.integer "guid",                           null: false
    t.integer "criteria", limit: 2,             null: false
    t.integer "counter",                        null: false
    t.integer "date",               default: 0, null: false
  end

  create_table "character_action", id: false, force: :cascade do |t|
    t.integer "guid",             default: 0, null: false
    t.integer "spec",   limit: 2, default: 0, null: false
    t.integer "button", limit: 2, default: 0, null: false
    t.integer "action",           default: 0, null: false
    t.integer "type",   limit: 2, default: 0, null: false
  end

  create_table "character_arena_stats", id: false, force: :cascade do |t|
    t.integer "guid",                       null: false
    t.integer "slot",             limit: 2, null: false
    t.integer "matchMakerRating", limit: 2, null: false
  end

  create_table "character_aura", id: false, force: :cascade do |t|
    t.integer "guid",                       default: 0, null: false
    t.integer "caster_guid",      limit: 8, default: 0, null: false
    t.integer "item_guid",        limit: 8, default: 0, null: false
    t.integer "spell",                      default: 0, null: false
    t.integer "effect_mask",      limit: 2, default: 0, null: false
    t.integer "recalculate_mask", limit: 2, default: 0, null: false
    t.integer "stackcount",       limit: 2, default: 1, null: false
    t.integer "amount0",                    default: 0, null: false
    t.integer "amount1",                    default: 0, null: false
    t.integer "amount2",                    default: 0, null: false
    t.integer "base_amount0",               default: 0, null: false
    t.integer "base_amount1",               default: 0, null: false
    t.integer "base_amount2",               default: 0, null: false
    t.integer "maxduration",                default: 0, null: false
    t.integer "remaintime",                 default: 0, null: false
    t.integer "remaincharges",    limit: 2, default: 0, null: false
  end

  create_table "character_banned", id: false, force: :cascade do |t|
    t.integer "guid",                  default: 0, null: false
    t.integer "bandate",               default: 0, null: false
    t.integer "unbandate",             default: 0, null: false
    t.string  "bannedby",  limit: 50,              null: false
    t.string  "banreason", limit: 255,             null: false
    t.integer "active",    limit: 2,   default: 1, null: false
  end

  create_table "character_battleground_data", primary_key: "guid", force: :cascade do |t|
    t.integer "instanceId",                         null: false
    t.integer "team",       limit: 2,               null: false
    t.float   "joinX",                default: 0.0, null: false
    t.float   "joinY",                default: 0.0, null: false
    t.float   "joinZ",                default: 0.0, null: false
    t.float   "joinO",                default: 0.0, null: false
    t.integer "joinMapId",  limit: 2, default: 0,   null: false
    t.integer "taxiStart",            default: 0,   null: false
    t.integer "taxiEnd",              default: 0,   null: false
    t.integer "mountSpell",           default: 0,   null: false
  end

  create_table "character_battleground_random", primary_key: "guid", force: :cascade do |t|
  end

  create_table "character_declinedname", primary_key: "guid", force: :cascade do |t|
    t.string "genitive",      limit: 15, default: "", null: false
    t.string "dative",        limit: 15, default: "", null: false
    t.string "accusative",    limit: 15, default: "", null: false
    t.string "instrumental",  limit: 15, default: "", null: false
    t.string "prepositional", limit: 15, default: "", null: false
  end

  create_table "character_equipmentsets", primary_key: "setguid", force: :cascade do |t|
    t.integer "guid",                    default: 0, null: false
    t.integer "setindex",    limit: 2,   default: 0, null: false
    t.string  "name",        limit: 31,              null: false
    t.string  "iconname",    limit: 100,             null: false
    t.integer "ignore_mask",             default: 0, null: false
    t.integer "item0",                   default: 0, null: false
    t.integer "item1",                   default: 0, null: false
    t.integer "item2",                   default: 0, null: false
    t.integer "item3",                   default: 0, null: false
    t.integer "item4",                   default: 0, null: false
    t.integer "item5",                   default: 0, null: false
    t.integer "item6",                   default: 0, null: false
    t.integer "item7",                   default: 0, null: false
    t.integer "item8",                   default: 0, null: false
    t.integer "item9",                   default: 0, null: false
    t.integer "item10",                  default: 0, null: false
    t.integer "item11",                  default: 0, null: false
    t.integer "item12",                  default: 0, null: false
    t.integer "item13",                  default: 0, null: false
    t.integer "item14",                  default: 0, null: false
    t.integer "item15",                  default: 0, null: false
    t.integer "item16",                  default: 0, null: false
    t.integer "item17",                  default: 0, null: false
    t.integer "item18",                  default: 0, null: false
  end

  create_table "character_gifts", primary_key: "item_guid", force: :cascade do |t|
    t.integer "guid",  default: 0, null: false
    t.integer "entry", default: 0, null: false
    t.integer "flags", default: 0, null: false
  end

  create_table "character_glyphs", id: false, force: :cascade do |t|
    t.integer "guid",                         null: false
    t.integer "spec",   limit: 2, default: 0, null: false
    t.integer "glyph1", limit: 2, default: 0
    t.integer "glyph2", limit: 2, default: 0
    t.integer "glyph3", limit: 2, default: 0
    t.integer "glyph4", limit: 2, default: 0
    t.integer "glyph5", limit: 2, default: 0
    t.integer "glyph6", limit: 2, default: 0
  end

  create_table "character_homebind", primary_key: "guid", force: :cascade do |t|
    t.integer "mapId",  limit: 2, default: 0,   null: false
    t.integer "zoneId", limit: 2, default: 0,   null: false
    t.float   "posX",             default: 0.0, null: false
    t.float   "posY",             default: 0.0, null: false
    t.float   "posZ",             default: 0.0, null: false
  end

  create_table "character_instance", id: false, force: :cascade do |t|
    t.integer "guid",                default: 0, null: false
    t.integer "instance",            default: 0, null: false
    t.integer "permanent", limit: 2, default: 0, null: false
  end

  create_table "character_inventory", primary_key: "item", force: :cascade do |t|
    t.integer "guid",           default: 0, null: false
    t.integer "bag",            default: 0, null: false
    t.integer "slot", limit: 2, default: 0, null: false
  end

  create_table "character_pet", force: :cascade do |t|
    t.integer "entry",                     default: 0,     null: false
    t.integer "owner",                     default: 0,     null: false
    t.integer "modelid",                   default: 0
    t.integer "CreatedBySpell",            default: 0,     null: false
    t.integer "PetType",        limit: 2,  default: 0,     null: false
    t.integer "level",          limit: 2,  default: 1,     null: false
    t.integer "exp",                       default: 0,     null: false
    t.integer "Reactstate",     limit: 2,  default: 0,     null: false
    t.string  "name",           limit: 21, default: "Pet", null: false
    t.integer "renamed",        limit: 2,  default: 0,     null: false
    t.integer "slot",           limit: 2,  default: 0,     null: false
    t.integer "curhealth",                 default: 1,     null: false
    t.integer "curmana",                   default: 0,     null: false
    t.integer "curhappiness",              default: 0,     null: false
    t.integer "savetime",                  default: 0,     null: false
    t.text    "abdata"
  end

  create_table "character_pet_declinedname", force: :cascade do |t|
    t.integer "owner",                    default: 0,  null: false
    t.string  "genitive",      limit: 12, default: "", null: false
    t.string  "dative",        limit: 12, default: "", null: false
    t.string  "accusative",    limit: 12, default: "", null: false
    t.string  "instrumental",  limit: 12, default: "", null: false
    t.string  "prepositional", limit: 12, default: "", null: false
  end

  create_table "character_queststatus", id: false, force: :cascade do |t|
    t.integer "guid",                  default: 0, null: false
    t.integer "quest",                 default: 0, null: false
    t.integer "status",      limit: 2, default: 0, null: false
    t.integer "explored",    limit: 2, default: 0, null: false
    t.integer "timer",                 default: 0, null: false
    t.integer "mobcount1",   limit: 2, default: 0, null: false
    t.integer "mobcount2",   limit: 2, default: 0, null: false
    t.integer "mobcount3",   limit: 2, default: 0, null: false
    t.integer "mobcount4",   limit: 2, default: 0, null: false
    t.integer "itemcount1",  limit: 2, default: 0, null: false
    t.integer "itemcount2",  limit: 2, default: 0, null: false
    t.integer "itemcount3",  limit: 2, default: 0, null: false
    t.integer "itemcount4",  limit: 2, default: 0, null: false
    t.integer "playercount", limit: 2, default: 0, null: false
  end

  create_table "character_queststatus_daily", id: false, force: :cascade do |t|
    t.integer "guid",  default: 0, null: false
    t.integer "quest", default: 0, null: false
    t.integer "time",  default: 0, null: false
  end

  create_table "character_queststatus_monthly", id: false, force: :cascade do |t|
    t.integer "guid",  default: 0, null: false
    t.integer "quest", default: 0, null: false
  end

  create_table "character_queststatus_rewarded", id: false, force: :cascade do |t|
    t.integer "guid",             default: 0, null: false
    t.integer "quest",            default: 0, null: false
    t.integer "active", limit: 2, default: 1, null: false
  end

  create_table "character_queststatus_seasonal", id: false, force: :cascade do |t|
    t.integer "guid",  default: 0, null: false
    t.integer "quest", default: 0, null: false
    t.integer "event", default: 0, null: false
  end

  create_table "character_queststatus_weekly", id: false, force: :cascade do |t|
    t.integer "guid",  default: 0, null: false
    t.integer "quest", default: 0, null: false
  end

  create_table "character_reputation", id: false, force: :cascade do |t|
    t.integer "guid",               default: 0, null: false
    t.integer "faction",  limit: 2, default: 0, null: false
    t.integer "standing",           default: 0, null: false
    t.integer "flags",    limit: 2, default: 0, null: false
  end

  create_table "character_skills", id: false, force: :cascade do |t|
    t.integer "guid",            null: false
    t.integer "skill", limit: 2, null: false
    t.integer "value", limit: 2, null: false
    t.integer "max",   limit: 2, null: false
  end

  create_table "character_social", id: false, force: :cascade do |t|
    t.integer "guid",              default: 0,  null: false
    t.integer "friend",            default: 0,  null: false
    t.integer "flags",  limit: 2,  default: 0,  null: false
    t.string  "note",   limit: 48, default: "", null: false
  end

  create_table "character_spell", id: false, force: :cascade do |t|
    t.integer "guid",               default: 0, null: false
    t.integer "spell",              default: 0, null: false
    t.integer "active",   limit: 2, default: 1, null: false
    t.integer "disabled", limit: 2, default: 0, null: false
  end

  create_table "character_spell_cooldown", id: false, force: :cascade do |t|
    t.integer "guid",  default: 0, null: false
    t.integer "spell", default: 0, null: false
    t.integer "item",  default: 0, null: false
    t.integer "time",  default: 0, null: false
  end

  create_table "character_stats", primary_key: "guid", force: :cascade do |t|
    t.integer "maxhealth",         default: 0,   null: false
    t.integer "maxpower1",         default: 0,   null: false
    t.integer "maxpower2",         default: 0,   null: false
    t.integer "maxpower3",         default: 0,   null: false
    t.integer "maxpower4",         default: 0,   null: false
    t.integer "maxpower5",         default: 0,   null: false
    t.integer "maxpower6",         default: 0,   null: false
    t.integer "maxpower7",         default: 0,   null: false
    t.integer "strength",          default: 0,   null: false
    t.integer "agility",           default: 0,   null: false
    t.integer "stamina",           default: 0,   null: false
    t.integer "intellect",         default: 0,   null: false
    t.integer "spirit",            default: 0,   null: false
    t.integer "armor",             default: 0,   null: false
    t.integer "resHoly",           default: 0,   null: false
    t.integer "resFire",           default: 0,   null: false
    t.integer "resNature",         default: 0,   null: false
    t.integer "resFrost",          default: 0,   null: false
    t.integer "resShadow",         default: 0,   null: false
    t.integer "resArcane",         default: 0,   null: false
    t.float   "blockPct",          default: 0.0, null: false
    t.float   "dodgePct",          default: 0.0, null: false
    t.float   "parryPct",          default: 0.0, null: false
    t.float   "critPct",           default: 0.0, null: false
    t.float   "rangedCritPct",     default: 0.0, null: false
    t.float   "spellCritPct",      default: 0.0, null: false
    t.integer "attackPower",       default: 0,   null: false
    t.integer "rangedAttackPower", default: 0,   null: false
    t.integer "spellPower",        default: 0,   null: false
    t.integer "resilience",        default: 0,   null: false
  end

  create_table "character_talent", id: false, force: :cascade do |t|
    t.integer "guid",                        null: false
    t.integer "spell",                       null: false
    t.integer "spec",  limit: 2, default: 0, null: false
  end

  create_table "characters", primary_key: "guid", force: :cascade do |t|
    t.integer "account",                         default: 0,   null: false
    t.string  "name",                 limit: 12,               null: false
    t.integer "race",                 limit: 2,  default: 0,   null: false
    t.integer "class",                limit: 2,  default: 0,   null: false
    t.integer "gender",               limit: 2,  default: 0,   null: false
    t.integer "level",                limit: 2,  default: 0,   null: false
    t.integer "xp",                              default: 0,   null: false
    t.integer "money",                           default: 0,   null: false
    t.integer "playerBytes",                     default: 0,   null: false
    t.integer "playerBytes2",                    default: 0,   null: false
    t.integer "playerFlags",                     default: 0,   null: false
    t.float   "position_x",                      default: 0.0, null: false
    t.float   "position_y",                      default: 0.0, null: false
    t.float   "position_z",                      default: 0.0, null: false
    t.integer "map",                  limit: 2,  default: 0,   null: false
    t.integer "instance_id",                     default: 0,   null: false
    t.integer "instance_mode_mask",   limit: 2,  default: 0,   null: false
    t.float   "orientation",                     default: 0.0, null: false
    t.text    "taximask",                                      null: false
    t.integer "online",               limit: 2,  default: 0,   null: false
    t.integer "cinematic",            limit: 2,  default: 0,   null: false
    t.integer "totaltime",                       default: 0,   null: false
    t.integer "leveltime",                       default: 0,   null: false
    t.integer "logout_time",                     default: 0,   null: false
    t.integer "is_logout_resting",    limit: 2,  default: 0,   null: false
    t.float   "rest_bonus",                      default: 0.0, null: false
    t.integer "resettalents_cost",               default: 0,   null: false
    t.integer "resettalents_time",               default: 0,   null: false
    t.float   "trans_x",                         default: 0.0, null: false
    t.float   "trans_y",                         default: 0.0, null: false
    t.float   "trans_z",                         default: 0.0, null: false
    t.float   "trans_o",                         default: 0.0, null: false
    t.integer "transguid",                       default: 0,   null: false
    t.integer "extra_flags",          limit: 2,  default: 0,   null: false
    t.integer "stable_slots",         limit: 2,  default: 0,   null: false
    t.integer "at_login",             limit: 2,  default: 0,   null: false
    t.integer "zone",                 limit: 2,  default: 0,   null: false
    t.integer "death_expire_time",               default: 0,   null: false
    t.text    "taxi_path"
    t.integer "arenaPoints",                     default: 0,   null: false
    t.integer "totalHonorPoints",                default: 0,   null: false
    t.integer "todayHonorPoints",                default: 0,   null: false
    t.integer "yesterdayHonorPoints",            default: 0,   null: false
    t.integer "totalKills",                      default: 0,   null: false
    t.integer "todayKills",           limit: 2,  default: 0,   null: false
    t.integer "yesterdayKills",       limit: 2,  default: 0,   null: false
    t.integer "chosenTitle",                     default: 0,   null: false
    t.integer "knownCurrencies",      limit: 8,  default: 0,   null: false
    t.integer "watchedFaction",                  default: 0,   null: false
    t.integer "drunk",                limit: 2,  default: 0,   null: false
    t.integer "health",                          default: 0,   null: false
    t.integer "power1",                          default: 0,   null: false
    t.integer "power2",                          default: 0,   null: false
    t.integer "power3",                          default: 0,   null: false
    t.integer "power4",                          default: 0,   null: false
    t.integer "power5",                          default: 0,   null: false
    t.integer "power6",                          default: 0,   null: false
    t.integer "power7",                          default: 0,   null: false
    t.integer "latency",                         default: 0,   null: false
    t.integer "speccount",            limit: 2,  default: 1,   null: false
    t.integer "activespec",           limit: 2,  default: 0,   null: false
    t.text    "exploredZones"
    t.text    "equipmentCache"
    t.integer "ammoId",                          default: 0,   null: false
    t.text    "knownTitles"
    t.integer "actionBars",           limit: 2,  default: 0,   null: false
    t.integer "grantableLevels",      limit: 2,  default: 0,   null: false
    t.integer "deleteInfos_Account"
    t.string  "deleteInfos_Name",     limit: 12
    t.integer "deleteDate"
  end

  create_table "corpse", primary_key: "corpseGuid", force: :cascade do |t|
    t.integer "guid",                  default: 0,   null: false
    t.float   "posX",                  default: 0.0, null: false
    t.float   "posY",                  default: 0.0, null: false
    t.float   "posZ",                  default: 0.0, null: false
    t.float   "orientation",           default: 0.0, null: false
    t.integer "mapId",       limit: 2, default: 0,   null: false
    t.integer "phaseMask",             default: 1,   null: false
    t.integer "displayId",             default: 0,   null: false
    t.text    "itemCache",                           null: false
    t.integer "bytes1",                default: 0,   null: false
    t.integer "bytes2",                default: 0,   null: false
    t.integer "guildId",               default: 0,   null: false
    t.integer "flags",       limit: 2, default: 0,   null: false
    t.integer "dynFlags",    limit: 2, default: 0,   null: false
    t.integer "time",                  default: 0,   null: false
    t.integer "corpseType",  limit: 2, default: 0,   null: false
    t.integer "instanceId",            default: 0,   null: false
  end

  create_table "creature_respawn", id: false, force: :cascade do |t|
    t.integer "guid",                  default: 0, null: false
    t.integer "respawnTime",           default: 0, null: false
    t.integer "mapId",       limit: 2, default: 0, null: false
    t.integer "instanceId",            default: 0, null: false
  end

  create_table "game_event_condition_save", id: false, force: :cascade do |t|
    t.integer "eventEntry",   limit: 2,               null: false
    t.integer "condition_id",           default: 0,   null: false
    t.float   "done",                   default: 0.0
  end

  create_table "game_event_save", primary_key: "eventEntry", force: :cascade do |t|
    t.integer "state",      limit: 2, default: 1, null: false
    t.integer "next_start",           default: 0, null: false
  end

  create_table "gameobject_respawn", id: false, force: :cascade do |t|
    t.integer "guid",                  default: 0, null: false
    t.integer "respawnTime",           default: 0, null: false
    t.integer "mapId",       limit: 2, default: 0, null: false
    t.integer "instanceId",            default: 0, null: false
  end

  create_table "gm_subsurveys", id: false, force: :cascade do |t|
    t.integer "surveyId",                null: false
    t.integer "subsurveyId", default: 0, null: false
    t.integer "rank",        default: 0, null: false
    t.text    "comment",                 null: false
  end

  create_table "gm_surveys", primary_key: "surveyId", force: :cascade do |t|
    t.integer "guid",           default: 0, null: false
    t.integer "mainSurvey",     default: 0, null: false
    t.text    "overallComment",             null: false
    t.integer "createTime",     default: 0, null: false
  end

  create_table "gm_tickets", primary_key: "ticketId", force: :cascade do |t|
    t.integer "guid",                        default: 0,   null: false
    t.string  "name",             limit: 12,               null: false
    t.text    "message",                                   null: false
    t.integer "createTime",                  default: 0,   null: false
    t.integer "mapId",            limit: 2,  default: 0,   null: false
    t.float   "posX",                        default: 0.0, null: false
    t.float   "posY",                        default: 0.0, null: false
    t.float   "posZ",                        default: 0.0, null: false
    t.integer "lastModifiedTime",            default: 0,   null: false
    t.integer "closedBy",                    default: 0,   null: false
    t.integer "assignedTo",                  default: 0,   null: false
    t.text    "comment",                                   null: false
    t.text    "response",                                  null: false
    t.integer "completed",        limit: 2,  default: 0,   null: false
    t.integer "escalated",        limit: 2,  default: 0,   null: false
    t.integer "viewed",           limit: 2,  default: 0,   null: false
    t.integer "haveTicket",       limit: 2,  default: 0,   null: false
  end

  create_table "group_instance", id: false, force: :cascade do |t|
    t.integer "guid",                default: 0, null: false
    t.integer "instance",            default: 0, null: false
    t.integer "permanent", limit: 2, default: 0, null: false
  end

  create_table "group_member", primary_key: "memberGuid", force: :cascade do |t|
    t.integer "guid",                              null: false
    t.integer "memberFlags", limit: 2, default: 0, null: false
    t.integer "subgroup",    limit: 2, default: 0, null: false
    t.integer "roles",       limit: 2, default: 0, null: false
  end

  create_table "groups", primary_key: "guid", force: :cascade do |t|
    t.integer "leaderGuid",                             null: false
    t.integer "lootMethod",       limit: 2,             null: false
    t.integer "looterGuid",                             null: false
    t.integer "lootThreshold",    limit: 2,             null: false
    t.integer "icon1",            limit: 8,             null: false
    t.integer "icon2",            limit: 8,             null: false
    t.integer "icon3",            limit: 8,             null: false
    t.integer "icon4",            limit: 8,             null: false
    t.integer "icon5",            limit: 8,             null: false
    t.integer "icon6",            limit: 8,             null: false
    t.integer "icon7",            limit: 8,             null: false
    t.integer "icon8",            limit: 8,             null: false
    t.integer "groupType",        limit: 2,             null: false
    t.integer "difficulty",       limit: 2, default: 0, null: false
    t.integer "raiddifficulty",   limit: 2, default: 0, null: false
    t.integer "masterLooterGuid",                       null: false
  end

  create_table "guild", primary_key: "guildid", force: :cascade do |t|
    t.string  "name",            limit: 24,  default: "", null: false
    t.integer "leaderguid",                  default: 0,  null: false
    t.integer "EmblemStyle",     limit: 2,   default: 0,  null: false
    t.integer "EmblemColor",     limit: 2,   default: 0,  null: false
    t.integer "BorderStyle",     limit: 2,   default: 0,  null: false
    t.integer "BorderColor",     limit: 2,   default: 0,  null: false
    t.integer "BackgroundColor", limit: 2,   default: 0,  null: false
    t.string  "info",            limit: 500, default: "", null: false
    t.string  "motd",            limit: 128, default: "", null: false
    t.integer "createdate",                  default: 0,  null: false
    t.integer "BankMoney",       limit: 8,   default: 0,  null: false
  end

  create_table "guild_bank_eventlog", id: false, force: :cascade do |t|
    t.integer "guildid",                  default: 0, null: false
    t.integer "LogGuid",                  default: 0, null: false
    t.integer "TabId",          limit: 2, default: 0, null: false
    t.integer "EventType",      limit: 2, default: 0, null: false
    t.integer "PlayerGuid",               default: 0, null: false
    t.integer "ItemOrMoney",              default: 0, null: false
    t.integer "ItemStackCount", limit: 2, default: 0, null: false
    t.integer "DestTabId",      limit: 2, default: 0, null: false
    t.integer "TimeStamp",                default: 0, null: false
  end

  create_table "guild_bank_item", id: false, force: :cascade do |t|
    t.integer "guildid",             default: 0, null: false
    t.integer "TabId",     limit: 2, default: 0, null: false
    t.integer "SlotId",    limit: 2, default: 0, null: false
    t.integer "item_guid",           default: 0, null: false
  end

  create_table "guild_bank_right", id: false, force: :cascade do |t|
    t.integer "guildid",              default: 0, null: false
    t.integer "TabId",      limit: 2, default: 0, null: false
    t.integer "rid",        limit: 2, default: 0, null: false
    t.integer "gbright",    limit: 2, default: 0, null: false
    t.integer "SlotPerDay",           default: 0, null: false
  end

  create_table "guild_bank_tab", id: false, force: :cascade do |t|
    t.integer "guildid",             default: 0,  null: false
    t.integer "TabId",   limit: 2,   default: 0,  null: false
    t.string  "TabName", limit: 16,  default: "", null: false
    t.string  "TabIcon", limit: 100, default: "", null: false
    t.string  "TabText", limit: 500
  end

  create_table "guild_eventlog", id: false, force: :cascade do |t|
    t.integer "guildid",               null: false
    t.integer "LogGuid",               null: false
    t.integer "EventType",   limit: 2, null: false
    t.integer "PlayerGuid1",           null: false
    t.integer "PlayerGuid2",           null: false
    t.integer "NewRank",     limit: 2, null: false
    t.integer "TimeStamp",             null: false
  end

  create_table "guild_member", id: false, force: :cascade do |t|
    t.integer "guildid",                         null: false
    t.integer "guid",                            null: false
    t.integer "rank",    limit: 2,               null: false
    t.string  "pnote",   limit: 31, default: "", null: false
    t.string  "offnote", limit: 31, default: "", null: false
  end

  create_table "guild_member_withdraw", primary_key: "guid", force: :cascade do |t|
    t.integer "tab0",  default: 0, null: false
    t.integer "tab1",  default: 0, null: false
    t.integer "tab2",  default: 0, null: false
    t.integer "tab3",  default: 0, null: false
    t.integer "tab4",  default: 0, null: false
    t.integer "tab5",  default: 0, null: false
    t.integer "money", default: 0, null: false
  end

  create_table "guild_rank", id: false, force: :cascade do |t|
    t.integer "guildid",                    default: 0,  null: false
    t.integer "rid",             limit: 2,               null: false
    t.string  "rname",           limit: 20, default: "", null: false
    t.integer "rights",                     default: 0,  null: false
    t.integer "BankMoneyPerDay",            default: 0,  null: false
  end

  create_table "instance", force: :cascade do |t|
    t.integer "map",                 limit: 2, default: 0, null: false
    t.integer "resettime",                     default: 0, null: false
    t.integer "difficulty",          limit: 2, default: 0, null: false
    t.integer "completedEncounters",           default: 0, null: false
    t.text    "data",                                      null: false
  end

  create_table "instance_reset", id: false, force: :cascade do |t|
    t.integer "mapid",      limit: 2, default: 0, null: false
    t.integer "difficulty", limit: 2, default: 0, null: false
    t.integer "resettime",            default: 0, null: false
  end

  create_table "ip2nation", id: false, force: :cascade do |t|
    t.integer "ip",                default: 0,  null: false
    t.string  "country", limit: 2, default: "", null: false
  end

  add_index "ip2nation", ["ip"], name: "ip", using: :btree

  create_table "ip2nationCountries", primary_key: "code", force: :cascade do |t|
    t.string "iso_code_2",  limit: 2,   default: "",  null: false
    t.string "iso_code_3",  limit: 3,   default: ""
    t.string "iso_country", limit: 255, default: "",  null: false
    t.string "country",     limit: 255, default: "",  null: false
    t.float  "lat",                     default: 0.0, null: false
    t.float  "lon",                     default: 0.0, null: false
  end

  add_index "ip2nationCountries", ["code"], name: "code", using: :btree

  create_table "ip_banned", id: false, force: :cascade do |t|
    t.string  "ip",        limit: 15,  default: "127.0.0.1", null: false
    t.integer "bandate",                                     null: false
    t.integer "unbandate",                                   null: false
    t.string  "bannedby",  limit: 50,  default: "[Console]", null: false
    t.string  "banreason", limit: 255, default: "no reason", null: false
  end

  create_table "item_instance", primary_key: "guid", force: :cascade do |t|
    t.integer "itemEntry",                  default: 0, null: false
    t.integer "owner_guid",                 default: 0, null: false
    t.integer "creatorGuid",                default: 0, null: false
    t.integer "giftCreatorGuid",            default: 0, null: false
    t.integer "count",                      default: 1, null: false
    t.integer "duration",                   default: 0, null: false
    t.text    "charges"
    t.integer "flags",                      default: 0, null: false
    t.text    "enchantments",                           null: false
    t.integer "randomPropertyId", limit: 2, default: 0, null: false
    t.integer "durability",       limit: 2, default: 0, null: false
    t.integer "playedTime",                 default: 0, null: false
    t.text    "text"
  end

  create_table "item_loot_items", id: false, force: :cascade do |t|
    t.integer "container_id",    default: 0,     null: false
    t.integer "item_id",         default: 0,     null: false
    t.integer "item_count",      default: 0,     null: false
    t.boolean "follow_rules",    default: false, null: false
    t.boolean "ffa",             default: false, null: false
    t.boolean "blocked",         default: false, null: false
    t.boolean "counted",         default: false, null: false
    t.boolean "under_threshold", default: false, null: false
    t.boolean "needs_quest",     default: false, null: false
    t.integer "rnd_prop",        default: 0,     null: false
    t.integer "rnd_suffix",      default: 0,     null: false
  end

  create_table "item_loot_money", id: false, force: :cascade do |t|
    t.integer "container_id", default: 0, null: false
    t.integer "money",        default: 0, null: false
  end

  create_table "item_refund_instance", id: false, force: :cascade do |t|
    t.integer "item_guid",                              null: false
    t.integer "player_guid",                            null: false
    t.integer "paidMoney",                  default: 0, null: false
    t.integer "paidExtendedCost", limit: 2, default: 0, null: false
  end

  create_table "item_soulbound_trade_data", primary_key: "itemGuid", force: :cascade do |t|
    t.text "allowedPlayers", null: false
  end

  create_table "lag_reports", primary_key: "reportId", force: :cascade do |t|
    t.integer "guid",                 default: 0,   null: false
    t.integer "lagType",    limit: 2, default: 0,   null: false
    t.integer "mapId",      limit: 2, default: 0,   null: false
    t.float   "posX",                 default: 0.0, null: false
    t.float   "posY",                 default: 0.0, null: false
    t.float   "posZ",                 default: 0.0, null: false
    t.integer "latency",              default: 0,   null: false
    t.integer "createTime",           default: 0,   null: false
  end

  create_table "lfg_data", primary_key: "guid", force: :cascade do |t|
    t.integer "dungeon",           default: 0, null: false
    t.integer "state",   limit: 2, default: 0, null: false
  end

  create_table "logs", id: false, force: :cascade do |t|
    t.integer "time",                           null: false
    t.integer "realm",                          null: false
    t.string  "type",   limit: 250,             null: false
    t.integer "level",  limit: 2,   default: 0, null: false
    t.text    "string"
  end

  create_table "logs_ip_actions", force: :cascade do |t|
    t.integer  "account_id",                                      null: false
    t.integer  "character_guid",                                  null: false
    t.integer  "type",           limit: 2,                        null: false
    t.string   "ip",             limit: 15, default: "127.0.0.1", null: false
    t.text     "systemnote"
    t.integer  "unixtime",                                        null: false
    t.datetime "time",                                            null: false
    t.text     "comment"
  end

  create_table "mail", force: :cascade do |t|
    t.integer "messageType",    limit: 2, default: 0,  null: false
    t.integer "stationery",     limit: 2, default: 41, null: false
    t.integer "mailTemplateId", limit: 2, default: 0,  null: false
    t.integer "sender",                   default: 0,  null: false
    t.integer "receiver",                 default: 0,  null: false
    t.text    "subject"
    t.text    "body"
    t.integer "has_items",      limit: 2, default: 0,  null: false
    t.integer "expire_time",              default: 0,  null: false
    t.integer "deliver_time",             default: 0,  null: false
    t.integer "money",                    default: 0,  null: false
    t.integer "cod",                      default: 0,  null: false
    t.integer "checked",        limit: 2, default: 0,  null: false
  end

  create_table "mail_items", primary_key: "item_guid", force: :cascade do |t|
    t.integer "mail_id",  default: 0, null: false
    t.integer "receiver", default: 0, null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner"
  end

  create_table "pet_aura", id: false, force: :cascade do |t|
    t.integer "guid",                       default: 0, null: false
    t.integer "caster_guid",      limit: 8, default: 0, null: false
    t.integer "spell",                      default: 0, null: false
    t.integer "effect_mask",      limit: 2, default: 0, null: false
    t.integer "recalculate_mask", limit: 2, default: 0, null: false
    t.integer "stackcount",       limit: 2, default: 1, null: false
    t.integer "amount0",                                null: false
    t.integer "amount1",                                null: false
    t.integer "amount2",                                null: false
    t.integer "base_amount0",                           null: false
    t.integer "base_amount1",                           null: false
    t.integer "base_amount2",                           null: false
    t.integer "maxduration",                default: 0, null: false
    t.integer "remaintime",                 default: 0, null: false
    t.integer "remaincharges",    limit: 2, default: 0, null: false
  end

  create_table "pet_spell", id: false, force: :cascade do |t|
    t.integer "guid",             default: 0, null: false
    t.integer "spell",            default: 0, null: false
    t.integer "active", limit: 2, default: 0, null: false
  end

  create_table "pet_spell_cooldown", id: false, force: :cascade do |t|
    t.integer "guid",  default: 0, null: false
    t.integer "spell", default: 0, null: false
    t.integer "time",  default: 0, null: false
  end

  create_table "petition", id: false, force: :cascade do |t|
    t.integer "ownerguid",                           null: false
    t.integer "petitionguid",            default: 0
    t.string  "name",         limit: 24,             null: false
    t.integer "type",         limit: 2,  default: 0, null: false
  end

  create_table "petition_sign", id: false, force: :cascade do |t|
    t.integer "ownerguid",                            null: false
    t.integer "petitionguid",             default: 0, null: false
    t.integer "playerguid",               default: 0, null: false
    t.integer "player_account",           default: 0, null: false
    t.integer "type",           limit: 2, default: 0, null: false
  end

  create_table "pool_quest_save", id: false, force: :cascade do |t|
    t.integer "pool_id",  default: 0, null: false
    t.integer "quest_id", default: 0, null: false
  end

  create_table "pvpstats_battlegrounds", force: :cascade do |t|
    t.integer  "winner_faction", limit: 2, null: false
    t.integer  "bracket_id",     limit: 2, null: false
    t.integer  "type",           limit: 2, null: false
    t.datetime "date",                     null: false
  end

  create_table "pvpstats_players", id: false, force: :cascade do |t|
    t.integer "battleground_id",       limit: 8,             null: false
    t.integer "character_guid",                              null: false
    t.integer "score_killing_blows",                         null: false
    t.integer "score_deaths",                                null: false
    t.integer "score_honorable_kills",                       null: false
    t.integer "score_bonus_honor",                           null: false
    t.integer "score_damage_done",                           null: false
    t.integer "score_healing_done",                          null: false
    t.integer "attr_1",                          default: 0, null: false
    t.integer "attr_2",                          default: 0, null: false
    t.integer "attr_3",                          default: 0, null: false
    t.integer "attr_4",                          default: 0, null: false
    t.integer "attr_5",                          default: 0, null: false
  end

  create_table "quest_tracker", id: false, force: :cascade do |t|
    t.integer  "id",                              default: 0,     null: false
    t.integer  "character_guid",                  default: 0,     null: false
    t.datetime "quest_accept_time",                               null: false
    t.datetime "quest_complete_time"
    t.datetime "quest_abandon_time"
    t.boolean  "completed_by_gm",                 default: false, null: false
    t.string   "core_hash",           limit: 120, default: "0",   null: false
    t.string   "core_revision",       limit: 120, default: "0",   null: false
  end

  create_table "rbac_account_permissions", id: false, force: :cascade do |t|
    t.integer "accountId",                   null: false
    t.integer "permissionId",                null: false
    t.boolean "granted",      default: true, null: false
    t.integer "realmId",      default: -1,   null: false
  end

  add_index "rbac_account_permissions", ["permissionId"], name: "fk__rbac_account_roles__rbac_permissions", using: :btree

  create_table "rbac_default_permissions", id: false, force: :cascade do |t|
    t.integer "secId",                     null: false
    t.integer "permissionId",              null: false
    t.integer "realmId",      default: -1, null: false
  end

  add_index "rbac_default_permissions", ["permissionId"], name: "fk__rbac_default_permissions__rbac_permissions", using: :btree

  create_table "rbac_linked_permissions", id: false, force: :cascade do |t|
    t.integer "id",       null: false
    t.integer "linkedId", null: false
  end

  add_index "rbac_linked_permissions", ["id"], name: "fk__rbac_linked_permissions__rbac_permissions1", using: :btree
  add_index "rbac_linked_permissions", ["linkedId"], name: "fk__rbac_linked_permissions__rbac_permissions2", using: :btree

  create_table "rbac_permissions", force: :cascade do |t|
    t.string "name", limit: 100, null: false
  end

  create_table "realmcharacters", id: false, force: :cascade do |t|
    t.integer "realmid",            default: 0, null: false
    t.integer "acctid",                         null: false
    t.integer "numchars", limit: 2, default: 0, null: false
  end

  add_index "realmcharacters", ["acctid"], name: "acctid", using: :btree

  create_table "realmlist", force: :cascade do |t|
    t.string  "name",                 limit: 32,  default: "",              null: false
    t.string  "address",              limit: 255, default: "127.0.0.1",     null: false
    t.string  "localAddress",         limit: 255, default: "127.0.0.1",     null: false
    t.string  "localSubnetMask",      limit: 255, default: "255.255.255.0", null: false
    t.integer "port",                 limit: 2,   default: 8085,            null: false
    t.integer "icon",                 limit: 2,   default: 0,               null: false
    t.integer "flag",                 limit: 2,   default: 2,               null: false
    t.integer "timezone",             limit: 2,   default: 0,               null: false
    t.integer "allowedSecurityLevel", limit: 2,   default: 0,               null: false
    t.float   "population",                       default: 0.0,             null: false
    t.integer "gamebuild",                        default: 12340,           null: false
  end

  add_index "realmlist", ["name"], name: "idx_name", unique: true, using: :btree

  create_table "reserved_name", primary_key: "name", force: :cascade do |t|
  end

  create_table "settings", force: :cascade do |t|
    t.string   "var",        limit: 255, null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

  create_table "updates", primary_key: "name", force: :cascade do |t|
    t.string   "hash",      limit: 40, default: ""
    t.string   "state",     limit: 8,  default: "RELEASED", null: false
    t.datetime "timestamp",                                 null: false
    t.integer  "speed",                default: 0,          null: false
  end

  create_table "updates_include", primary_key: "path", force: :cascade do |t|
    t.string "state", limit: 8, default: "RELEASED", null: false
  end

  create_table "uptime", id: false, force: :cascade do |t|
    t.integer "realmid",                                        null: false
    t.integer "starttime",              default: 0,             null: false
    t.integer "uptime",                 default: 0,             null: false
    t.integer "maxplayers", limit: 2,   default: 0,             null: false
    t.string  "revision",   limit: 255, default: "Trinitycore", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "name"
    t.string   "surname"
    t.string   "avatar"
    t.integer  "role"
    t.date     "birthday"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "warden_action", primary_key: "wardenId", force: :cascade do |t|
    t.integer "action", limit: 2
  end

  create_table "worldstates", primary_key: "entry", force: :cascade do |t|
    t.integer "value",   default: 0, null: false
    t.text    "comment"
  end

  add_foreign_key "rbac_account_permissions", "account", column: "accountId", name: "fk__rbac_account_permissions__account", on_delete: :cascade
  add_foreign_key "rbac_account_permissions", "rbac_permissions", column: "permissionId", name: "fk__rbac_account_roles__rbac_permissions", on_delete: :cascade
  add_foreign_key "rbac_default_permissions", "rbac_permissions", column: "permissionId", name: "fk__rbac_default_permissions__rbac_permissions"
  add_foreign_key "rbac_linked_permissions", "rbac_permissions", column: "id", name: "fk__rbac_linked_permissions__rbac_permissions1", on_delete: :cascade
  add_foreign_key "rbac_linked_permissions", "rbac_permissions", column: "linkedId", name: "fk__rbac_linked_permissions__rbac_permissions2", on_delete: :cascade
end
