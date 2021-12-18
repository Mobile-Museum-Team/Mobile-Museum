import 'package:flutter/material.dart';
import 'art.dart';

var DUMMY_DATA = [
  Art(
      "1",
      "The Abduction of the Sabine Women",
      "probably 1633–34",
      "Nicolas Poussin ",
      "https://collectionapi.metmuseum.org/api/collection/v1/iiif/437329/1763014/main-image",
      "French, Les Andelys 1594–1665 Rome",
      "1594",
      "1665",
      "According to Roman mythology, the neighboring Sabines were invited to a festival with the intention of forcibly retaining their young women as wives. When the Roman leader Romulus raised his cloak, his warriors seized the women. This dramatic story gave Poussin the opportunity to display his command of gesture and pose and his knowledge of ancient sculpture and architecture. The man at the right wears a yellow lorica made of leather. The painting belonged to the maréchal de Créquy, who was the French ambassador to Rome from June 1633 to July 1634, and then to Cardinal Richelieu.",
      "French",
      "Oil on canvas",
      "60 7/8 x 82 5/8 in. (154.6 x 209.9 cm)"),
  Art(
      "2",
      "The Death of Socrates",
      "1787",
      "Jacques Louis David ",
      "https://collectionapi.metmuseum.org/api/collection/v1/iiif/436105/1692908/main-image",
      "French, Paris 1748–1825 Brussels",
      "1748",
      "1825",
      "In this landmark of Neoclassical painting from the years immediately preceding the French Revolution, David took up a classical story of resisting unjust authority in a sparse, frieze-like composition. The Greek philosopher Socrates (469–399 B.C.) was convicted of impiety by the Athenian courts; rather than renounce his beliefs, he died willingly, discoursing on the immortality of the soul before drinking poisonous hemlock. Through a network of carefully articulated gestures and expressions, David’s figures act out the last moments of Socrates’s life. He is about to grasp the cup of hemlock, offered by a disciple who cannot bear to witness the act. David consulted antiquarian scholars in his pursuit of an archeologically exacting image, including details of furniture and clothing; his inclusion of Plato at the foot of the bed, however, deliberately references not someone present at Socrates’s death but, rather, the author whose text, Phaedo, had preserved this ancient story into modern times.",
      "French",
      "Oil on canvas",
      "51 x 77 1/4 in. (129.5 x 196.2 cm)"),
  Art(
      "3",
      "Helena de Kay Gilder",
      "1911",
      "Cecilia Beaux",
      "https://collectionapi.metmuseum.org/api/collection/v1/iiif/821931/1984932/restricted",
      "Cecilia Beaux (American, Philadelphia, Pennsylvania 1855–1942 Gloucester, Massachusetts)",
      "1855",
      "1942",
      "This tender and introspective late work by Cecilia Beaux—the most celebrated turn-of-the-20th-century woman painter of figures and portraits working in the U.S.—has dual importance due to both the painter and sitter. The intimate portrait depicts Beaux’s close friend, mentor, artist, and New York cultural tastemaker Helena de Kay Gilder (1848-1916), in mourning for her recently deceased husband, the progressive cultural leader, editor, and poet, Richard Watson Gilder. Beaux painted de Kay Gilder wearing a shoulder-length widow’s veil and holding a shoot of geranium ivy, a symbol of bridal favor and fidelity in the Victorian language of flowers. Beaux inscribed the painting to Rosamond Gilder, the couple's youngest daughter, who at the time was in the process of publishing her father's letters. Full of feeling, the work reveals the artist’s growing sensitivity to more experimental compositions—as suggested by the abstract backdrop for the figure and the delicate play of dark tones and diffused light emanating from the window at right.",
      "American",
      "Oil on canvas",
      "31 × 21 in. (78.7 × 53.3 cm)"),
  Art(
      "4",
      "View of Toledo",
      "ca. 1599–1600",
      "El Greco (Domenikos Theotokopoulos)",
      "https://collectionapi.metmuseum.org/api/collection/v1/iiif/436575/1455894/main-image",
      "El Greco (Domenikos Theotokopoulos) (Greek, Iráklion (Candia) 1541–1614 Toledo)",
      "1541",
      "1614",
      "In this, his greatest surviving landscape, El Greco portrays the city he lived and worked in for most of his life. The painting belongs to the tradition of emblematic city views, rather than a faithful documentary description. The view of the eastern section of Toledo from the north would have excluded the cathedral, which the artist therefore imaginatively moved to the left of the Alcázar (the royal palace). Other buildings represented in the painting include the ancient Alcántara Bridge, and on the other side of the river Tagus, the Castle of San Servando.",
      "Greek",
      "Oil on canvas",
      "47 3/4 x 42 3/4 in. (121.3 x 108.6 cm)"),
  Art(
      "5",
      "Captain George K. H. Coussmaker",
      "5",
      "f",
      "https://collectionapi.metmuseum.org/api/collection/v1/iiif/437447/799661/main-image",
      "",
      "",
      "",
      "",
      "",
      "",
      ""),
  Art(
      "6",
      "The Strange Thing Little Kiosai Saw in the River",
      "6",
      "f",
      "https://collectionapi.metmuseum.org/api/collection/v1/iiif/11388/43057/main-image",
      "",
      "",
      "",
      "",
      "",
      "",
      ""),
  Art(
      "7",
      "Mars and Venus United by Love",
      "7",
      "f",
      "https://collectionapi.metmuseum.org/api/collection/v1/iiif/437891/797737/main-image",
      "",
      "",
      "",
      "",
      "",
      "",
      ""),
  Art(
      "8",
      "Mrs. Mayer and Daughter",
      "8",
      "f",
      "https://collectionapi.metmuseum.org/api/collection/v1/iiif/11764/33129/main-image",
      "",
      "",
      "",
      "",
      "",
      "",
      ""),
  Art(
      "8",
      "Dutch Girl in White",
      "9",
      "f",
      "https://collectionapi.metmuseum.org/api/collection/v1/iiif/19303/33024/restricted",
      "",
      "",
      "",
      "",
      "",
      "",
      ""),
  Art(
      "10",
      "Saint Jerome as Scholar",
      "10",
      "f",
      "https://collectionapi.metmuseum.org/api/collection/v1/iiif/459088/913475/main-image",
      "",
      "",
      "",
      "",
      "",
      "",
      ""),
  Art(
      "11",
      "Madame X (Madame Pierre Gautreau)",
      "11",
      "f",
      "https://collectionapi.metmuseum.org/api/collection/v1/iiif/12127/33591/restricted",
      "",
      "",
      "",
      "",
      "",
      "",
      ""),
  Art(
      "12",
      "Broken Eggs",
      "12",
      "f",
      "https://collectionapi.metmuseum.org/api/collection/v1/iiif/436579/1702341/main-image",
      "",
      "",
      "",
      "",
      "",
      "",
      ""),
  Art(
      "13",
      "Portrait of a Carthusian",
      "13",
      "f",
      "https://collectionapi.metmuseum.org/api/collection/v1/iiif/435896/796328/main-image",
      "",
      "",
      "",
      "",
      "",
      "",
      ""),
  Art(
      "14",
      "Lute Player",
      "14",
      "f",
      "https://collectionapi.metmuseum.org/api/collection/v1/iiif/439933/799638/main-image",
      "",
      "",
      "",
      "",
      "",
      "",
      ""),
  Art(
      "15",
      "Merry Company on a Terrace",
      "15",
      "f",
      "https://collectionapi.metmuseum.org/api/collection/v1/iiif/437749/795836/main-image",
      "",
      "",
      "",
      "",
      "",
      "",
      ""),
  Art(
      "16",
      "Grape Wine",
      "16",
      "f",
      "https://collectionapi.metmuseum.org/api/collection/v1/iiif/489674/1017801/restricted",
      "",
      "",
      "",
      "",
      "",
      "",
      ""),
  Art(
      "17",
      "Cottage Children (The Wood Gatherers)",
      "17",
      "f",
      "https://collectionapi.metmuseum.org/api/collection/v1/iiif/436440/799809/main-image",
      "",
      "",
      "",
      "",
      "",
      "",
      ""),
  Art(
      "18",
      "Juan de Pareja (1606–1670)",
      "18",
      "f",
      "https://collectionapi.metmuseum.org/api/collection/v1/iiif/437869/1763004/main-image",
      "",
      "",
      "",
      "",
      "",
      "",
      ""),
  Art(
      "19",
      "Daniel Crommelin Verplanck",
      "19",
      "f",
      "https://collectionapi.metmuseum.org/api/collection/v1/iiif/10522/34316/main-image",
      "",
      "",
      "",
      "",
      "",
      "",
      ""),
  Art(
      "20",
      "The Hatch Family",
      "20",
      "f",
      "https://collectionapi.metmuseum.org/api/collection/v1/iiif/11263/34369/main-image",
      "",
      "",
      "",
      "",
      "",
      "",
      ""),
  Art(
      "21",
      "Our Lady of Valvanera",
      "21",
      "f",
      "https://collectionapi.metmuseum.org/api/collection/v1/iiif/764091/1880328/main-image",
      "",
      "",
      "",
      "",
      "",
      "",
      "")
];
