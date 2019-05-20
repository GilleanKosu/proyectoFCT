<?php

namespace App\Repository;

use App\Entity\TituloPropiedad;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method TituloPropiedad|null find($id, $lockMode = null, $lockVersion = null)
 * @method TituloPropiedad|null findOneBy(array $criteria, array $orderBy = null)
 * @method TituloPropiedad[]    findAll()
 * @method TituloPropiedad[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TituloPropiedadRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, TituloPropiedad::class);
    }

    // /**
    //  * @return TituloPropiedad[] Returns an array of TituloPropiedad objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('t')
            ->andWhere('t.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('t.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?TituloPropiedad
    {
        return $this->createQueryBuilder('t')
            ->andWhere('t.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
    public function findTituloById($value): ?TituloPropiedad
    {
        return $this->createQueryBuilder('t')
            ->andWhere('t.casilla = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
}
