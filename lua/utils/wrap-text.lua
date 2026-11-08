local M = {}

function M.wrap_text(text, width)
  local lines = {}

  for _, paragraph in ipairs(vim.split(text, "\n")) do
    local line = ""

    for word in paragraph:gmatch("%S+") do
      if #line > 0 and #line + #word + 1 > width then
        table.insert(lines, line)
        line = word
      else
        line = (#line > 0) and (line .. " " .. word) or word
      end
    end

    table.insert(lines, line)
  end

  return table.concat(lines, "\n")
end

return M
