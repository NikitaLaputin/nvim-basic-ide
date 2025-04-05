local status_ok, npairs = pcall(require, "mini.pairs")
if not status_ok then
	return
end

npairs.setup()
