add_rules("mode.debug", "mode.release")

target("Charcount")
    set_kind("binary")
    add_files("src/*.cpp")