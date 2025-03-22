function stringify(inlines)
    local result = {}
    for _, inline in ipairs(inlines) do
      if inline.t == "Str" or inline.t == "Code" then
        table.insert(result, inline.text)
      elseif inline.t == "Space" then
        table.insert(result, " ")
      elseif inline.t == "SoftBreak" or inline.t == "LineBreak" then
        table.insert(result, "\n")
      end
    end
    return table.concat(result)
  end
  
  function Header(el)
    local text = stringify(el.content)
  
    if el.level == 1 then
      return {
        pandoc.RawBlock("latex", "\\part{" .. text .. "}"),
        pandoc.RawBlock("latex", "\\setcounter{section}{0}"),
        pandoc.RawBlock("latex", "\\setcounter{subsection}{0}"),
        pandoc.RawBlock("latex", "\\setcounter{subsubsection}{0}")
      }
  
    elseif el.level == 2 then
      return {
        pandoc.RawBlock("latex", "\\section{" .. text .. "}"),
        pandoc.RawBlock("latex", "\\setcounter{subsection}{0}"),
        pandoc.RawBlock("latex", "\\setcounter{subsubsection}{0}")
      }
  
    elseif el.level == 3 then
      return {
        pandoc.RawBlock("latex", "\\subsection{" .. text .. "}"),
        pandoc.RawBlock("latex", "\\setcounter{subsubsection}{0}")
      }
  
    elseif el.level == 4 then
      return pandoc.RawBlock("latex", "\\subsubsection{" .. text .. "}")
  
    else
      return el -- deeper headers left unchanged, or change as needed
    end
  end
  