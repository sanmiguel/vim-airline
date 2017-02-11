" vim: et ts=2 sts=2 sw=2

if !exists(':Neomake')
  finish
endif

let s:error_symbol = get(g:, 'airline#extensions#neomake#error_symbol', 'E:')
let s:warning_symbol = get(g:, 'airline#extensions#neomake#warning_symbol', 'W:')
let s:jobs_symbol = get(g:, 'airline#extensions#neomake#jobs_symbol', 'J:')

function! airline#extensions#neomake#get_warnings()
  let counts = neomake#statusline#LoclistCounts()
  let warnings = get(counts, 'W', 0)
  return warnings ? s:warning_symbol.warnings : ''
endfunction

function! airline#extensions#neomake#get_errors()
  let counts = neomake#statusline#LoclistCounts()
  let errors = get(counts, 'E', 0)
  return errors ? s:error_symbol.errors : ''
endfunction

function! airline#extensions#neomake#get_jobs()
  let jobs = neomake#statusline#JobCount()
  return jobs ? s:jobs_symbol.jobs : ''
endfunction

function! airline#extensions#neomake#init(ext)
  call airline#parts#define_function('neomake_warning_count', 'airline#extensions#neomake#get_warnings')
  call airline#parts#define_function('neomake_error_count', 'airline#extensions#neomake#get_errors')
  call airline#parts#define_function('neomake_jobs_count', 'airline#extensions#neomake#get_jobs')
endfunction
