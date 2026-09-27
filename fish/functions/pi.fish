function _pi_bwrap
   set -l git_bind

   if test -d "$PWD/.git"
       set git_bind --ro-bind "$PWD/.git" "$PWD/.git"
   end

   # jiti кэширует транспиляцию TS/ESM-расширений в $TMPDIR/jiti.
   # /tmp остаётся приватным RAM-tmpfs; на диск персистим только кэш jiti.
   mkdir -p "$HOME/.cache/pi-jiti"

   bwrap \
       --ro-bind /usr /usr \
       --ro-bind /bin /bin \
       --ro-bind /lib /lib \
       --ro-bind /lib64 /lib64 \
       --ro-bind /etc/resolv.conf /etc/resolv.conf \
       --ro-bind /etc/hosts /etc/hosts \
       --proc /proc \
       --dev /dev \
       --tmpfs /tmp \
       --bind "$HOME/.cache/pi-jiti" /tmp/jiti \
       --dir /home \
       --bind "$HOME/configs/pi/extensions" "$HOME/configs/pi/extensions" \
       --bind "$HOME/.pi-lens" "$HOME/.pi-lens" \
       --ro-bind "$HOME/.local/share/nvim/mason" "$HOME/.local/share/nvim/mason" \
       --bind "$PWD" "$PWD" \
       $git_bind \
       --bind "$HOME/.pi" "$HOME/.pi" \
       --setenv PATH "$HOME/.cargo/bin/:$HOME/.local/share/nvim/mason/bin:/usr/bin:/bin" \
       $argv \
       -- pi $_PI_ARGS
end

function pi
   echo "running in bwrap without network"
   set -g _PI_ARGS $argv
   _pi_bwrap
end

