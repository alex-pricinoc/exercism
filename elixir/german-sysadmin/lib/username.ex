defmodule Username do
  def sanitize(''), do: ''

  def sanitize([h | t]) do
    transformed =
      case h do
        ?ä -> 'ae'
        ?ö -> 'oe'
        ?ü -> 'ue'
        ?ß -> 'ss'
        h when h in ?a..?z -> [h]
        ?_ -> '_'
        _ -> ''
      end

    transformed ++ sanitize(t)
  end
end
