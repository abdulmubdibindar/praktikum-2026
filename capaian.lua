Span = function(el)
  if el.classes:includes("capaian") then
    if FORMAT == "latex" then
      -- Wraps the content in a custom LaTeX command \capaian{...}
      table.insert(el.content, 1, pandoc.RawInline("latex", "\\capaian{"))
      table.insert(el.content, pandoc.RawInline("latex", "}"))
      return el.content
    end
  end
end
