local config = {
    window = {
        -- remove border around info block
        info = { border = "none" }
    },
}

require('mini.completion').setup(config)
