return {
  s('ali', {
    t('\\begin{align*}'),
    t({'', '\t'}), i(0),
    t({'', '\\end{align*}'})
  }),
  s('equa', {
    t('\\begin{equation*}'),
    t({'', '\t'}), i(0),
    t({'', '\\end{equation*}'})
  }),
  s('enum', {
    t('\\begin{enumerate}'),
    t({'', '\t\\item '}), i(0),
    t({'', '\\end{enumerate}'})
  }),
  s('mini', {
    t('\\begin{minipage}[t]{0.5\\linewidth}'),
    t({'', '\t'}), i(0),
    t({'', '\\end{minipage}%'}),
    t({'', '\\begin{minipage}[t]{0.5\\linewidth}'}),
    t({'', '\t'}),
    t({'', '\\end{minipage}'}),
  }),
  s('table', {
    t('\\begin{table}[h!]'),
    t({'', '\t\\centering'}),
    t({'', '\t\\begin{tabular}{'}), i(0), t('}'),
    t({'', '\t\\end{tabular}'}),
    t({'', '\\end{table}'})
  }),
  s('fig', {
    t('\\begin{figure}[h!]'),
    t({'', '\t\\centering'}),
    t({'', '\t'}), i(0),
    t({'', '\\end{figure}'}),
  }),
  s('it', {
    t('\\textit{'), i(0), t('}'),
  }),
  s('bf', {
    t('\\textbf{'), i(0), t('}'),
  }),
  s('frac', {
    t('\\frac{'), i(1), t('}{'), i(2), t('}'),
  }),
  s('sum', {
    t('\\sum_{'), i(1), t('}^{'), i(2), t('} '),
  }),
}
