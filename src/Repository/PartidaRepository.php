<?php

namespace App\Repository;

use App\Entity\Partida;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method Partida|null find($id, $lockMode = null, $lockVersion = null)
 * @method Partida|null findOneBy(array $criteria, array $orderBy = null)
 * @method Partida[]    findAll()
 * @method Partida[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PartidaRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Partida::class);
    }

    // /**
    //  * @return Partida[] Returns an array of Partida objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('p.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Partida
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */

    public function findAllGames(): ?array
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.id >= :val')
            ->addSelect("COUNT(p.id) numero_partidas")
            ->setParameter('val', 0)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    public function findOneById($value): ?Partida
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.id = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    public function countAllGames(): ?array
    {
        return $this->createQueryBuilder('p')
            ->select('count(p.id)')
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    public function gamesByDate($fechaComienzo, $fechaFin): ?array
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.fecha BETWEEN :fechaComienzo AND :fechaFin')
            ->setParameter('fechaComienzo', $fechaComienzo)
            ->setParameter('fechaFin', $fechaFin)
            ->select('count(p.id)')
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    public function partidaMasLarga(): ?array
    {
        return $this->createQueryBuilder('p')
            ->select('p, MAX(p.num_turnos) AS max_score')
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
}
