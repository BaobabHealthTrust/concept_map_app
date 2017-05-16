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

ActiveRecord::Schema.define(version: 20170515083617) do

  create_table "columns_priv", primary_key: ["Host", "Db", "User", "Table_name", "Column_name"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "Column privileges" do |t|
    t.string   "Host",        limit: 60, default: "",                         null: false
    t.string   "Db",          limit: 64, default: "",                         null: false
    t.string   "User",        limit: 16, default: "",                         null: false
    t.string   "Table_name",  limit: 64, default: "",                         null: false
    t.string   "Column_name", limit: 64, default: "",                         null: false
    t.datetime "Timestamp",              default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "Column_priv", limit: 31, default: "",                         null: false, collation: "utf8_general_ci"
  end

  create_table "db", primary_key: ["Host", "Db", "User"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "Database privileges" do |t|
    t.string "Host",                  limit: 60, default: "",  null: false
    t.string "Db",                    limit: 64, default: "",  null: false
    t.string "User",                  limit: 16, default: "",  null: false
    t.string "Select_priv",           limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Insert_priv",           limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Update_priv",           limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Delete_priv",           limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Create_priv",           limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Drop_priv",             limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Grant_priv",            limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "References_priv",       limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Index_priv",            limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Alter_priv",            limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Create_tmp_table_priv", limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Lock_tables_priv",      limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Create_view_priv",      limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Show_view_priv",        limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Create_routine_priv",   limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Alter_routine_priv",    limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Execute_priv",          limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Event_priv",            limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Trigger_priv",          limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.index ["User"], name: "User", using: :btree
  end

  create_table "event", primary_key: ["db", "name"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "Events" do |t|
    t.string   "db",                   limit: 64,         default: "",                         null: false, collation: "utf8_bin"
    t.string   "name",                 limit: 64,         default: "",                         null: false
    t.binary   "body",                 limit: 4294967295,                                      null: false
    t.string   "definer",              limit: 77,         default: "",                         null: false, collation: "utf8_bin"
    t.datetime "execute_at"
    t.integer  "interval_value"
    t.string   "interval_field",       limit: 18
    t.datetime "created",                                 default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "modified",                                                                     null: false
    t.datetime "last_executed"
    t.datetime "starts"
    t.datetime "ends"
    t.string   "status",               limit: 18,         default: "ENABLED",                  null: false
    t.string   "on_completion",        limit: 8,          default: "DROP",                     null: false
    t.string   "sql_mode",             limit: 478,        default: "",                         null: false
    t.string   "comment",              limit: 64,         default: "",                         null: false, collation: "utf8_bin"
    t.integer  "originator",                                                                   null: false,                                 unsigned: true
    t.string   "time_zone",            limit: 64,         default: "SYSTEM",                   null: false, collation: "latin1_swedish_ci"
    t.string   "character_set_client", limit: 32,                                                           collation: "utf8_bin"
    t.string   "collation_connection", limit: 32,                                                           collation: "utf8_bin"
    t.string   "db_collation",         limit: 32,                                                           collation: "utf8_bin"
    t.binary   "body_utf8",            limit: 4294967295
  end

  create_table "func", primary_key: "name", id: :string, limit: 64, default: "", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "User defined functions" do |t|
    t.boolean "ret",              default: false, null: false
    t.string  "dl",   limit: 128, default: "",    null: false
    t.string  "type", limit: 9,                   null: false, collation: "utf8_general_ci"
  end

  create_table "general_log", id: false, force: :cascade, options: "ENGINE=CSV DEFAULT CHARSET=utf8", comment: "General log" do |t|
    t.datetime "event_time",                    default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.text     "user_host",    limit: 16777215,                                      null: false
    t.integer  "thread_id",                                                          null: false
    t.integer  "server_id",                                                          null: false, unsigned: true
    t.string   "command_type", limit: 64,                                            null: false
    t.text     "argument",     limit: 16777215,                                      null: false
  end

  create_table "help_category", primary_key: "help_category_id", id: :integer, limit: 2, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "help categories" do |t|
    t.string  "name",               limit: 64,    null: false
    t.integer "parent_category_id", limit: 2,                  unsigned: true
    t.text    "url",                limit: 65535, null: false
    t.index ["name"], name: "name", unique: true, using: :btree
  end

  create_table "help_keyword", primary_key: "help_keyword_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "help keywords" do |t|
    t.string "name", limit: 64, null: false
    t.index ["name"], name: "name", unique: true, using: :btree
  end

  create_table "help_relation", primary_key: ["help_keyword_id", "help_topic_id"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "keyword-topic relation" do |t|
    t.integer "help_topic_id",   null: false, unsigned: true
    t.integer "help_keyword_id", null: false, unsigned: true
  end

  create_table "help_topic", primary_key: "help_topic_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "help topics" do |t|
    t.string  "name",             limit: 64,    null: false
    t.integer "help_category_id", limit: 2,     null: false, unsigned: true
    t.text    "description",      limit: 65535, null: false
    t.text    "example",          limit: 65535, null: false
    t.text    "url",              limit: 65535, null: false
    t.index ["name"], name: "name", unique: true, using: :btree
  end

  create_table "host", primary_key: ["Host", "Db"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "Host privileges;  Merged with database privileges" do |t|
    t.string "Host",                  limit: 60, default: "",  null: false
    t.string "Db",                    limit: 64, default: "",  null: false
    t.string "Select_priv",           limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Insert_priv",           limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Update_priv",           limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Delete_priv",           limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Create_priv",           limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Drop_priv",             limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Grant_priv",            limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "References_priv",       limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Index_priv",            limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Alter_priv",            limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Create_tmp_table_priv", limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Lock_tables_priv",      limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Create_view_priv",      limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Show_view_priv",        limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Create_routine_priv",   limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Alter_routine_priv",    limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Execute_priv",          limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
    t.string "Trigger_priv",          limit: 1,  default: "N", null: false, collation: "utf8_general_ci"
  end

  create_table "ndb_binlog_index", primary_key: "epoch", id: :bigint, default: nil, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.bigint "Position",  null: false, unsigned: true
    t.string "File",      null: false
    t.bigint "inserts",   null: false, unsigned: true
    t.bigint "updates",   null: false, unsigned: true
    t.bigint "deletes",   null: false, unsigned: true
    t.bigint "schemaops", null: false, unsigned: true
  end

  create_table "plugin", primary_key: "name", id: :string, limit: 64, default: "", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "MySQL plugins" do |t|
    t.string "dl", limit: 128, default: "", null: false
  end

  create_table "proc", primary_key: ["db", "name", "type"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "Stored Procedures" do |t|
    t.string   "db",                   limit: 64,         default: "",                         null: false, collation: "utf8_bin"
    t.string   "name",                 limit: 64,         default: "",                         null: false
    t.string   "type",                 limit: 9,                                               null: false
    t.string   "specific_name",        limit: 64,         default: "",                         null: false
    t.string   "language",             limit: 3,          default: "SQL",                      null: false
    t.string   "sql_data_access",      limit: 17,         default: "CONTAINS_SQL",             null: false
    t.string   "is_deterministic",     limit: 3,          default: "NO",                       null: false
    t.string   "security_type",        limit: 7,          default: "DEFINER",                  null: false
    t.binary   "param_list",           limit: 65535,                                           null: false
    t.binary   "returns",              limit: 4294967295,                                      null: false
    t.binary   "body",                 limit: 4294967295,                                      null: false
    t.string   "definer",              limit: 77,         default: "",                         null: false, collation: "utf8_bin"
    t.datetime "created",                                 default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "modified",                                                                     null: false
    t.string   "sql_mode",             limit: 478,        default: "",                         null: false
    t.text     "comment",              limit: 65535,                                           null: false, collation: "utf8_bin"
    t.string   "character_set_client", limit: 32,                                                           collation: "utf8_bin"
    t.string   "collation_connection", limit: 32,                                                           collation: "utf8_bin"
    t.string   "db_collation",         limit: 32,                                                           collation: "utf8_bin"
    t.binary   "body_utf8",            limit: 4294967295
  end

  create_table "procs_priv", primary_key: ["Host", "Db", "User", "Routine_name", "Routine_type"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "Procedure privileges" do |t|
    t.string   "Host",         limit: 60, default: "",                         null: false
    t.string   "Db",           limit: 64, default: "",                         null: false
    t.string   "User",         limit: 16, default: "",                         null: false
    t.string   "Routine_name", limit: 64, default: "",                         null: false, collation: "utf8_general_ci"
    t.string   "Routine_type", limit: 9,                                       null: false
    t.string   "Grantor",      limit: 77, default: "",                         null: false
    t.string   "Proc_priv",    limit: 27, default: "",                         null: false, collation: "utf8_general_ci"
    t.datetime "Timestamp",               default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["Grantor"], name: "Grantor", using: :btree
  end

  create_table "proxies_priv", primary_key: ["Host", "User", "Proxied_host", "Proxied_user"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "User proxy privileges" do |t|
    t.string   "Host",         limit: 60, default: "",                         null: false
    t.string   "User",         limit: 16, default: "",                         null: false
    t.string   "Proxied_host", limit: 60, default: "",                         null: false
    t.string   "Proxied_user", limit: 16, default: "",                         null: false
    t.boolean  "With_grant",              default: false,                      null: false
    t.string   "Grantor",      limit: 77, default: "",                         null: false
    t.datetime "Timestamp",               default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["Grantor"], name: "Grantor", using: :btree
  end

  create_table "servers", primary_key: "Server_name", id: :string, limit: 64, default: "", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "MySQL Foreign Servers table" do |t|
    t.string  "Host",     limit: 64, default: "", null: false
    t.string  "Db",       limit: 64, default: "", null: false
    t.string  "Username", limit: 64, default: "", null: false
    t.string  "Password", limit: 64, default: "", null: false
    t.integer "Port",                default: 0,  null: false
    t.string  "Socket",   limit: 64, default: "", null: false
    t.string  "Wrapper",  limit: 64, default: "", null: false
    t.string  "Owner",    limit: 64, default: "", null: false
  end

  create_table "slow_log", id: false, force: :cascade, options: "ENGINE=CSV DEFAULT CHARSET=utf8", comment: "Slow log" do |t|
    t.datetime "start_time",                      default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.text     "user_host",      limit: 16777215,                                      null: false
    t.time     "query_time",                                                           null: false
    t.time     "lock_time",                                                            null: false
    t.integer  "rows_sent",                                                            null: false
    t.integer  "rows_examined",                                                        null: false
    t.string   "db",             limit: 512,                                           null: false
    t.integer  "last_insert_id",                                                       null: false
    t.integer  "insert_id",                                                            null: false
    t.integer  "server_id",                                                            null: false, unsigned: true
    t.text     "sql_text",       limit: 16777215,                                      null: false
  end

  create_table "tables_priv", primary_key: ["Host", "Db", "User", "Table_name"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "Table privileges" do |t|
    t.string   "Host",        limit: 60, default: "",                         null: false
    t.string   "Db",          limit: 64, default: "",                         null: false
    t.string   "User",        limit: 16, default: "",                         null: false
    t.string   "Table_name",  limit: 64, default: "",                         null: false
    t.string   "Grantor",     limit: 77, default: "",                         null: false
    t.datetime "Timestamp",              default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "Table_priv",  limit: 98, default: "",                         null: false, collation: "utf8_general_ci"
    t.string   "Column_priv", limit: 31, default: "",                         null: false, collation: "utf8_general_ci"
    t.index ["Grantor"], name: "Grantor", using: :btree
  end

  create_table "time_zone", primary_key: "Time_zone_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "Time zones" do |t|
    t.string "Use_leap_seconds", limit: 1, default: "N", null: false
  end

  create_table "time_zone_leap_second", primary_key: "Transition_time", id: :bigint, default: nil, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "Leap seconds information for time zones" do |t|
    t.integer "Correction", null: false
  end

  create_table "time_zone_name", primary_key: "Name", id: :string, limit: 64, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "Time zone names" do |t|
    t.integer "Time_zone_id", null: false, unsigned: true
  end

  create_table "time_zone_transition", primary_key: ["Time_zone_id", "Transition_time"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "Time zone transitions" do |t|
    t.integer "Time_zone_id",       null: false, unsigned: true
    t.bigint  "Transition_time",    null: false
    t.integer "Transition_type_id", null: false, unsigned: true
  end

  create_table "time_zone_transition_type", primary_key: ["Time_zone_id", "Transition_type_id"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "Time zone transition types" do |t|
    t.integer "Time_zone_id",                              null: false, unsigned: true
    t.integer "Transition_type_id",                        null: false, unsigned: true
    t.integer "Offset",                       default: 0,  null: false
    t.integer "Is_DST",             limit: 1, default: 0,  null: false, unsigned: true
    t.string  "Abbreviation",       limit: 8, default: "", null: false
  end

  create_table "user", primary_key: ["Host", "User"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "Users and global privileges" do |t|
    t.string  "Host",                   limit: 60,    default: "",  null: false
    t.string  "User",                   limit: 16,    default: "",  null: false
    t.string  "Password",               limit: 41,    default: "",  null: false, collation: "latin1_bin"
    t.string  "Select_priv",            limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Insert_priv",            limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Update_priv",            limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Delete_priv",            limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Create_priv",            limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Drop_priv",              limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Reload_priv",            limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Shutdown_priv",          limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Process_priv",           limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "File_priv",              limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Grant_priv",             limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "References_priv",        limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Index_priv",             limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Alter_priv",             limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Show_db_priv",           limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Super_priv",             limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Create_tmp_table_priv",  limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Lock_tables_priv",       limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Execute_priv",           limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Repl_slave_priv",        limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Repl_client_priv",       limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Create_view_priv",       limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Show_view_priv",         limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Create_routine_priv",    limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Alter_routine_priv",     limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Create_user_priv",       limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Event_priv",             limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Trigger_priv",           limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "Create_tablespace_priv", limit: 1,     default: "N", null: false, collation: "utf8_general_ci"
    t.string  "ssl_type",               limit: 9,     default: "",  null: false, collation: "utf8_general_ci"
    t.binary  "ssl_cipher",             limit: 65535,               null: false
    t.binary  "x509_issuer",            limit: 65535,               null: false
    t.binary  "x509_subject",           limit: 65535,               null: false
    t.integer "max_questions",                        default: 0,   null: false,                               unsigned: true
    t.integer "max_updates",                          default: 0,   null: false,                               unsigned: true
    t.integer "max_connections",                      default: 0,   null: false,                               unsigned: true
    t.integer "max_user_connections",                 default: 0,   null: false,                               unsigned: true
    t.string  "plugin",                 limit: 64,    default: ""
    t.text    "authentication_string",  limit: 65535
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
