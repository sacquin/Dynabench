foreach ff (*.tgz)
set cust = $ff:r
echo "...processing " $cust "..."
tar xzf $ff
ls charmm-gui-*/*.pdb
\cp ../template/* charmm-gui-*/namd/

cd charmm-gui-*/namd
foreach gg (*.sh)
echo "......customizing " $gg
sed 's/CUSTOM/'$cust'/' $gg >! $gg.tmp 
\cp $gg.tmp $gg 
end

cd ..
tar czf ../new_$cust.tgz * 
cd ..
rm -r charmm-gui-*
echo ""
end
