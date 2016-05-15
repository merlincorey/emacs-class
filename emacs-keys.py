'''emacs-keys.py

Syntax: emacs-keys.py desc [desc [desc [...]]]

Return description of emacs key binding given a key description on the commandline.

Descriptions should be in emacs-chord syntax (e.g. C-x M-x).

This application exists to demonstrate keyboard macros by creating the mappings from notes.
'''

import sys

def make_mapping_editing_commands():
    return {'C-a':'Beginning of line',
            'C-e':'End of line',
            'C-v':'Scroll page down',
            'M-v':'Scroll page up',
            'M-<':'Top of buffer (meta+shift+\',\')',
            'M->':'End of buffer (meta+shift+\'.\')',
            'C-l':'Arrange buffer centered on line or top on line',
            'C-s':'Search forward incremental',
            'C-r':'Search reverse incremental'}


def main():
    mappings = make_mapping_editing_commands()
    if 1 < len(sys.argv):
        for arg in sys.argv[1:]:
            print '? {}'.format(arg)
            if arg in mappings:
                print mappings[arg]
            else:
                print 'Unknown command.'
    else:
        print __doc__
    

if '__main__' == __name__:
    main()
