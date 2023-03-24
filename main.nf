
process CRAWL_ACGT {
 tag "Getting KSK on $Chr using $task.cpus CPUs and $task.memory memory"
  //publishDir "${launchDir}/fastQC", mode:'copy'
  container 'quay.io/bgruening/galaxy-hicexplorer'
  input: val Chr output: path '*.csv'
  script:
  """
  hicPlotMatrix -m Palecek-microC-1_0.mcool::/resolutions/1000 -o Palecek-microC-1.png -dpi 400
  """ 
}

workflow { 
chromosome_ch = Channel.of('vzorek cesta')
 CRAWL_ACGT() 
}
