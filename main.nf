
process CRAWL_ACGT {
 tag "Getting KSK on $Chr using $task.cpus CPUs and $task.memory memory"
  container 'quay.io/bgruening/galaxy-hicexplorer'
  input:
  val Vzorek
  output:
  path '*.png'
  script:
  """
  hicPlotMatrix -m ${Vzorek}::/resolutions/1000 -o Palecek-microC-1.png -dpi 400
  """ 
}

workflow { 
chromosome_ch = Channel.of('/mnt/shared/MedGen/Palecek_HiC/Palecek_final/Palecek-MicroC-1/Palecek-microC-1_0.mcool')
 CRAWL_ACGT() 
}
