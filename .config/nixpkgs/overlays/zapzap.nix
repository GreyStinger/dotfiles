self: super:

{
  zapzap = super.zapzap.overrideAttrs (oldAttrs: {
    src = /home/jayden/oss/zapzap;
  });
}

