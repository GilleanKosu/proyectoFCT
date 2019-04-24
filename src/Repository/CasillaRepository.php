<?php

namespace App\Repository;

use App\Entity\Casilla;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method Casilla|null find($id, $lockMode = null, $lockVersion = null)
 * @method Casilla|null findOneBy(array $criteria, array $orderBy = null)
 * @method Casilla[]    findAll()
 * @method Casilla[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CasillaRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Casilla::class);
    }

    // /**
    //  * @return Casilla[] Returns an array of Casilla objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('c.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Casilla
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
